package com.ruoyi.blog.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.blog.mapper.LogsMapper;
import com.ruoyi.blog.domain.Logs;
import com.ruoyi.blog.service.ILogsService;
import com.ruoyi.common.support.Convert;

/**
 * 博客日志 服务层实现
 * 
 * @author lw
 * @date 2018-12-14
 */
@Service
public class LogsServiceImpl implements ILogsService 
{
	@Autowired
	private LogsMapper logsMapper;

	/**
     * 查询博客日志信息
     * 
     * @param id 博客日志ID
     * @return 博客日志信息
     */
    @Override
	public Logs selectLogsById(Integer id)
	{
	    return logsMapper.selectLogsById(id);
	}
	
	/**
     * 查询博客日志列表
     * 
     * @param logs 博客日志信息
     * @return 博客日志集合
     */
	@Override
	public List<Logs> selectLogsList(Logs logs)
	{
	    return logsMapper.selectLogsList(logs);
	}
	
    /**
     * 新增博客日志
     * 
     * @param logs 博客日志信息
     * @return 结果
     */
	@Override
	public int insertLogs(Logs logs)
	{
	    return logsMapper.insertLogs(logs);
	}
	
	/**
     * 修改博客日志
     * 
     * @param logs 博客日志信息
     * @return 结果
     */
	@Override
	public int updateLogs(Logs logs)
	{
	    return logsMapper.updateLogs(logs);
	}

	/**
     * 删除博客日志对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	@Override
	public int deleteLogsByIds(String ids)
	{
		return logsMapper.deleteLogsByIds(Convert.toStrArray(ids));
	}
	
}
