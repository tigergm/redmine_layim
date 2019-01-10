class LayimController < ApplicationController
  include LayimHelper
  helper :layim
  # 初始面板据
  def init
    unless User.current.logged?
      return
    end
    
    # 获取全员列表
    user_list = User.all
    # 形成数组
    list = []
    user_list.each do |user|
      if user.anonymous?
        next
      end
      status = 'hide' unless user.logged?
      if user.logged?
        status = user.online_status.blank? ? "hide":user.online_status 
      end
      user_hash = {
        "username": user.name, # 好友昵称
        "id": user.id, # 好友ID
        "avatar": avatar_url(user, {size:32}),
        "sign": user.sign, # 好友签名
        "status": status, # 若值为offline代表离线，online或者不填为在线
      }
      list.push user_hash  # 追加用户元素
    end
    
    # 生成群组
    group_list = []
    global_image_url = "/plugin_assets/redmine_layim/images/flyui.jpg"
    global_group_hash = {
      "groupname": l(:global_group), # 全员群组
      "id": "00", # 群组ID
      "avatar": global_image_url  # 群组头像
    } 
   
    group_list.push global_group_hash
   
    friend_list = []
    friend_global_hash = {
      "groupname": l(:global_friend_group), # 全员
      "id": 0, # 分组ID
      "list": list,
    }
    friend_list.push friend_global_hash
    
    # 如果处于某项目中，则加入项目群组
    unless params[:id].blank?
      project = Project.find params[:id]  # 获得当前的项目
      project_image_url = "/plugin_assets/redmine_layim/images/project_group.jpg"
      project_group_hash = {
        "groupname": project.name, # 全员群组
        "id": project.id, # 群组ID
        "avatar": project_image_url  # 群组头像
      } 
      group_list.push project_group_hash
      list = []
      user_list = project.users
      user_list.each do |user|
        if user.anonymous?
          next
        end
        
        status = 'hide' unless user.logged?
        if user.logged?
          status = user.online_status.blank? ? "hide":user.online_status 
        end
        user_hash = {
          "username": user.name, # 好友昵称
          "id": user.id, # 好友ID
          "avatar": avatar_url(user, {size:32}),
          "sign": user.sign, # 好友签名
          "status": status, # 若值为offline代表离线，online或者不填为在线
        }
        list.push user_hash  # 追加用户元素
      end
      friend_project_hash = {
        "groupname": project.name, # 项目成员
        "id": project.id, # 分组ID
        "list": list,
      }
      friend_list.push friend_project_hash
    end
    init_data = {
      "code": 0,
      "msg": "",
      "data": {
        "mine": {
          "username":  User.current.name,
          "id": User.current.id,
          "status": User.current.online_status.blank? ? "hide":User.current.online_status,
          "sign": User.current.sign,
          "avatar": avatar_url(User.current, {size:32}),
        },
        # 好友列表
        "friend": friend_list,
        # 群组列表
        "group": group_list 
      }
    }
    
    respond_to do |format|
      # 返回json格式的数据
      format.html { render json: init_data }
    end
  end
  
  # 群组数据
  def group
    unless User.current.logged?
      return
    end
    
    # 形成数组
    list = []
    group_id = params[:id]
    if group_id == "00"  # 全员组群数据
      # 获取全员表
      user_list = User.all
      user_list.each do |user|
        if user.anonymous?
          next
        end
        
        status = 'hide' unless user.logged?
        if user.logged?
          status = user.online_status.blank? ? "hide":user.online_status 
        end
        user_hash = {
          "username": user.name, # 好友昵称
          "id": user.id, # 好友ID
          "avatar": avatar_url(user, {size:32}),
          "sign": user.sign, # 好友签名
          "status": status, # 若值为offline代表离线，online或者不填为在线
        }
        list.push user_hash  # 追加用户元素
      end
    end
    
    if group_id != "00"  # 项目组群数据
      # 获取项目
      project = Project.find group_id
      user_list = project.users
      user_list.each do |user|
        if user.anonymous?
          next
        end
        
        status = 'hide' unless user.logged?
        if user.logged?
          status = user.online_status.blank? ? "hide":user.online_status 
        end
        user_hash = {
          "username": user.name, # 好友昵称
          "id": user.id, # 好友ID
          "avatar": avatar_url(user, {size:32}),
          "sign": user.sign, # 好友签名
          "status": status, # 若值为offline代表离线，online或者不填为在线
        }
        list.push user_hash  # 追加用户元素
      end
    end
    member_data = {
      "code": 0,
      "msg": "",
      "data": {
        "list": list,
      }
    }
    
    respond_to do |format|
      # 返回json格式的数据
      format.html { render json: member_data }
    end
  end
  
  # 更新用户在线状态
  def update_status
    if User.current.logged?
      status = params[:status]
      if ["hide", "online"].include? status
        User.current.update_attributes online_status:status unless User.current.anonymous?
      end
    end 
  end
  
  # 更新用户签名档
  def update_sign
    if User.current.logged?
      sign = params[:sign]
      User.current.update_attributes sign:sign unless User.current.anonymous?
    end 
  end
  
  # 更新皮肤
  def update_skin
    if User.current.logged?
      skin = params[:init_skin]
      User.current.update_attributes init_skin:skin unless User.current.anonymous?
    end 
  end
end
