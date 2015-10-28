//
//  XMPPManager.swift
//  IM
//
//  Created by Stoner Wang on 15/10/23.
//  Copyright © 2015年 Stoner.Wong. All rights reserved.
//

import UIKit
import XMPPFramework

private let XMPP_HOST = "stoner-rmbp.local"
private let XMPP_PORT: UInt16 = 5222

private let XMPP_DOMAIN = "stoner-rmbp.local"

class XMPPManager: NSObject, XMPPStreamDelegate, XMPPStreamManagementDelegate, XMPPRosterDelegate {
    
    var xmppStream: XMPPStream!
    
    var myJID: XMPPJID!
    var myPassword: String!
    
    /* 模块 */
    // 断线重连模块
    var xmppReconnect: XMPPReconnect!
    
    // 流管理模块
    var storage: XMPPStreamManagementMemoryStorage!
    var xmppStreamManagement: XMPPStreamManagement!
    
    // 好友模块
    var xmppRosterCoreDataStorage: XMPPRosterCoreDataStorage!
    var xmppRoster: XMPPRoster!
    
    // 消息模块
    var xmppMessageArchivingCoreDataStorage: XMPPMessageArchivingCoreDataStorage!
    var xmppMessageArchiving: XMPPMessageArchiving!

    /**
    单例模式获取XMPPManager实例
    
    - returns: instance XMPPManager
    */
    class func shareInstance() -> XMPPManager {
        struct Singleton {
            static var predicate: dispatch_once_t = 0
            static var instance: XMPPManager? = nil
        }
        
        dispatch_once(&Singleton.predicate, {
            Singleton.instance = XMPPManager()
            Singleton.instance!.setupStream()
        })
        
        return Singleton.instance!
    }
    
    override init() {
        super.init()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "applicationWillTerminate", name: UIApplicationWillTerminateNotification, object: nil)
    }
    
    func setupStream() {
        if xmppStream == nil {
            self.xmppStream = XMPPStream()
            // 设置xmpp服务器地址
            self.xmppStream.hostName = XMPP_HOST
            // 设置xmpp端口，默认5222
            self.xmppStream.hostPort = XMPP_PORT
            self.xmppStream.addDelegate(self, delegateQueue: dispatch_get_main_queue())
            // 心跳包时间
            self.xmppStream.keepAliveInterval = 30
            // 允许xmpp在后台运行
            self.xmppStream.enableBackgroundingOnSocket = true
            
            // 接入断线连接模块
            xmppReconnect = XMPPReconnect()
            xmppReconnect.autoReconnect = true
            xmppReconnect.activate(self.xmppStream)
            
            // 接入流管理模块，用于流恢复跟消息确认，在移动端很重要
            storage = XMPPStreamManagementMemoryStorage()
            xmppStreamManagement = XMPPStreamManagement(storage: storage)
            xmppStreamManagement.autoResume = true
            xmppStreamManagement.addDelegate(self, delegateQueue: dispatch_get_main_queue())
            xmppStreamManagement.activate(self.xmppStream)
            
            // 接入好友模块，可以获取好友列表
            xmppRosterCoreDataStorage = XMPPRosterCoreDataStorage()
            xmppRoster = XMPPRoster(rosterStorage: xmppRosterCoreDataStorage)
            xmppRoster.addDelegate(self, delegateQueue: dispatch_get_main_queue())
            xmppRoster.activate(self.xmppStream)
            
            // 接入消息模块，将消息存储到本地
            xmppMessageArchivingCoreDataStorage = XMPPMessageArchivingCoreDataStorage.sharedInstance()
            xmppMessageArchiving = XMPPMessageArchiving(messageArchivingStorage: xmppMessageArchivingCoreDataStorage, dispatchQueue: dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0))
            xmppMessageArchiving.activate(self.xmppStream)
        }
    }
    
    // MARK: - online, offline
    
    func loginWithName(userName: String, andPassword password: String) {
        myJID = XMPPJID.jidWithUser(userName, domain: XMPP_DOMAIN, resource: "iOS")
        myPassword = password
        xmppStream.myJID = myJID
        
        do {
            try xmppStream.connectWithTimeout(XMPPStreamTimeoutNone)
        } catch {
            let alertView = UIAlertView(title: "连接错误", message: "\(error)", delegate: nil, cancelButtonTitle: "Ok")
            alertView.show()
        }
    }
    
    func logout() {
        goOffline()
        self.xmppStream.disconnectAfterSending()
    }
    
    func goOnline() {
        // 发送在线通知给服务器，服务器才会将离线消息推送过来
        let presence = XMPPPresence()
        xmppStream.sendElement(presence)
    }
    
    func goOffline() {
        let presence = XMPPPresence(type: "unavailable")
        xmppStream.sendElement(presence)
    }
    
    func sendMessage(message: String, to jid: XMPPJID) {
        let newMessage = XMPPMessage(type: "chat", to: jid)
        newMessage.addBody(message)
        xmppStream.sendElement(newMessage)
    }
    
    // MARK: - connect delegate
    
    /**
    连接成功
    
    - parameter sender: sender description
    */
    func xmppStreamDidConnect(sender: XMPPStream!) {
        do {
            try self.xmppStream.authenticateWithPassword(self.myPassword)
        } catch {
            print(error)
        }
    }
    
    /**
    登录成功
    
    - parameter sender: sender description
    */
    func xmppStreamDidAuthenticate(sender: XMPPStream!) {
        NSNotificationCenter.defaultCenter().postNotificationName("DidLogin", object: nil)
        
        goOnline()
        
        // 启用流管理
        xmppStreamManagement.enableStreamManagementWithResumption(true, maxTimeout: 0)
    }
    
    func xmppStream(sender: XMPPStream!, didNotAuthenticate error: DDXMLElement!) {
        print(error)
        let alertView = UIAlertView(title: nil, message: "登录失败", delegate: nil, cancelButtonTitle: "Ok")
        alertView.show()
    }
    
    func xmppStream(sender: XMPPStream!, didReceivePresence presence: XMPPPresence!) {
        print("presence: from-\(presence.from().bare()), to-\(presence.to().bare())")
        NSNotificationCenter.defaultCenter().postNotificationName("RosterChanged", object: nil)
    }
    
    func xmppStream(sender: XMPPStream!, didReceiveMessage message: XMPPMessage!) {
        NSNotificationCenter.defaultCenter().postNotificationName("DidReceiveNewMessage", object: nil)
    }
    
    // MARK: - terminate
    
    func applicationWillTerminate() {
        let app = UIApplication.sharedApplication()
        var taskId: UIBackgroundTaskIdentifier!
        
        taskId = app.beginBackgroundTaskWithExpirationHandler({
            () -> Void in
            app.endBackgroundTask(taskId!)
        })
        
        if taskId == UIBackgroundTaskInvalid {
            return
        }
        
        self.xmppStream.disconnectAfterSending()
    }
    
}
