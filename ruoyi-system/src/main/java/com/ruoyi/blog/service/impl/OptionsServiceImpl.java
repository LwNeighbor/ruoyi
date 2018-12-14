package com.ruoyi.blog.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.blog.mapper.OptionsMapper;
import com.ruoyi.blog.domain.Options;
import com.ruoyi.blog.service.IOptionsService;
import com.ruoyi.common.support.Convert;

/**
 * 配置 服务层实现
 * 
 * @author lw
 * @date 2018-12-14
 */
@Service
public class OptionsServiceImpl implements IOptionsService 
{
	@Autowired
	private OptionsMapper optionsMapper;

	/**
     * 查询配置信息
     * 
     * @param name 配置ID
     * @return 配置信息
     */
    @Override
	public Options selectOptionsById(String name)
	{
	    return optionsMapper.selectOptionsById(name);
	}
	
	/**
     * 查询配置列表
     * 
     * @param options 配置信息
     * @return 配置集合
     */
	@Override
	public List<Options> selectOptionsList(Options options)
	{
	    return optionsMapper.selectOptionsList(options);
	}
	
    /**
     * 新增配置
     * 
     * @param options 配置信息
     * @return 结果
     */
	@Override
	public int insertOptions(Options options)
	{
	    return optionsMapper.insertOptions(options);
	}
	
	/**
     * 修改配置
     * 
     * @param options 配置信息
     * @return 结果
     */
	@Override
	public int updateOptions(Options options)
	{
	    return optionsMapper.updateOptions(options);
	}

	/**
     * 删除配置对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	@Override
	public int deleteOptionsByIds(String ids)
	{
		return optionsMapper.deleteOptionsByIds(Convert.toStrArray(ids));
	}
	
}
