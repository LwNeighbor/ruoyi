package com.ruoyi.blog.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.blog.mapper.MetasMapper;
import com.ruoyi.blog.domain.Metas;
import com.ruoyi.blog.service.IMetasService;
import com.ruoyi.common.support.Convert;

/**
 * 项目 服务层实现
 * 
 * @author lw
 * @date 2018-12-14
 */
@Service
public class MetasServiceImpl implements IMetasService 
{
	@Autowired
	private MetasMapper metasMapper;

	/**
     * 查询项目信息
     * 
     * @param mid 项目ID
     * @return 项目信息
     */
    @Override
	public Metas selectMetasById(Integer mid)
	{
	    return metasMapper.selectMetasById(mid);
	}
	
	/**
     * 查询项目列表
     * 
     * @param metas 项目信息
     * @return 项目集合
     */
	@Override
	public List<Metas> selectMetasList(Metas metas)
	{
	    return metasMapper.selectMetasList(metas);
	}
	
    /**
     * 新增项目
     * 
     * @param metas 项目信息
     * @return 结果
     */
	@Override
	public int insertMetas(Metas metas)
	{
	    return metasMapper.insertMetas(metas);
	}
	
	/**
     * 修改项目
     * 
     * @param metas 项目信息
     * @return 结果
     */
	@Override
	public int updateMetas(Metas metas)
	{
	    return metasMapper.updateMetas(metas);
	}

	/**
     * 删除项目对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	@Override
	public int deleteMetasByIds(String ids)
	{
		return metasMapper.deleteMetasByIds(Convert.toStrArray(ids));
	}
	
}
