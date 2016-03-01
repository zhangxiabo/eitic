package org.pigeon.eitic.constants;



import org.pigeon.eitic.vo.User;

import com.opensymphony.xwork2.ActionContext;

public class BaseUnit {
    
    /**
     * 把值放进session中。
     * @param key
     * @param value
     */
    public static void put(String key, Object value) {
        ActionContext.getContext().getSession().put(key, value);
    }
    
    /**
     * 注销用户.
     * 删除用户登录信息和通知信息
     */
    public static void logout() {
        ActionContext.getContext().getSession().remove(Constants.LOGIN_USER);
        ActionContext.getContext().getSession().remove(Constants.MAINPAGE_ALL_LIST);
        ActionContext.getContext().getSession().remove(Constants.MAINPAGE_COLLEGE_LIST);
    }

    public static User getLoginUser() {
        return (User)ActionContext.getContext().getSession().get(Constants.LOGIN_USER);
    }
    
    public static User get(String key) {
        return (User)ActionContext.getContext().getSession().get(key);
    }
    
}
