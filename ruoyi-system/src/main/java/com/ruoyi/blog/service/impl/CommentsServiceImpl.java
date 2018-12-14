package com.ruoyi.blog.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.blog.mapper.CommentsMapper;
import com.ruoyi.blog.domain.Comments;
import com.ruoyi.blog.service.ICommentsService;
import com.ruoyi.common.support.Convert;

/**
 * 评论 服务层实现
 * 
 * @author lw
 * @date 2018-12-14
 */
@Service
public class CommentsServiceImpl implements ICommentsService 
{
	@Autowired
	private CommentsMapper commentsMapper;

	/**
     * 查询评论信息
     * 
     * @param coid 评论ID
     * @return 评论信息
     */
    @Override
	public Comments selectCommentsById(Integer coid)
	{
	    return commentsMapper.selectCommentsById(coid);
	}
	
	/**
     * 查询评论列表
     * 
     * @param comments 评论信息
     * @return 评论集合
     */
	@Override
	public List<Comments> selectCommentsList(Comments comments)
	{
	    return commentsMapper.selectCommentsList(comments);
	}
	
    /**
     * 新增评论
     * 
     * @param comments 评论信息
     * @return 结果
     */
	@Override
	public int insertComments(Comments comments)
	{
	    return commentsMapper.insertComments(comments);
	}
	
	/**
     * 修改评论
     * 
     * @param comments 评论信息
     * @return 结果
     */
	@Override
	public int updateComments(Comments comments)
	{
	    return commentsMapper.updateComments(comments);
	}

	/**
     * 删除评论对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	@Override
	public int deleteCommentsByIds(String ids)
	{
		return commentsMapper.deleteCommentsByIds(Convert.toStrArray(ids));
	}
	
}
