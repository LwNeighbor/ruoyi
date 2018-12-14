package com.ruoyi.common.exception;

/**
* @Description:    博客的异常
* @Author:         lw
* @CreateDate:     2018/12/14 0014
* @Version:        1.0
*/
public class BlogException extends RuntimeException{

    public BlogException() {
    }

    public BlogException(String message) {
        super(message);
    }

    public BlogException(String message, Throwable cause) {
        super(message, cause);
    }

    public BlogException(Throwable cause) {
        super(cause);
    }

}
