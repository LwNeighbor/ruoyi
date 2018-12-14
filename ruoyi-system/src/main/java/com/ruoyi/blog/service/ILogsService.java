package com.ruoyi.blog.service;

import com.ruoyi.blog.domain.Logs;
import java.util.List;

/**
 * 博客日志 服务层
 * 
 * @author lw
 * @date 2018-12-14
 */
public interface ILogsService 
{
	/**
     * 查询博客日志信息
     * 
     * @param id 博客日志ID
     * @return 博客日志信息
     */
	public Logs selectLogsById(Integer id);
	
	/**
     * 查询博客日志列表
     * 
     * @param logs 博客日志信息
     * @return 博客日志集合
     */
	public List<Logs> selectLogsList(Logs logs);
	
	/**
     * 新增博客日志
     * 
     * @param logs 博客日志信息
     * @return 结果
     */
	public int insertLogs(Logs logs);
	
	/**
     * 修改博客日志
     * 
     * @param logs 博客日志信息
     * @return 结果
     */
	public int updateLogs(Logs logs);
		
	/**
     * 删除博客日志信息
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	public int deleteLogsByIds(String ids);
	
}
