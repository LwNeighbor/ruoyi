package com.ruoyi.blog.mapper;

import com.ruoyi.blog.domain.Comments;
import java.util.List;	

/**
 * 评论 数据层
 * 
 * @author lw
 * @date 2018-12-14
 */
public interface CommentsMapper 
{
	/**
     * 查询评论信息
     * 
     * @param coid 评论ID
     * @return 评论信息
     */
	public Comments selectCommentsById(Integer coid);
	
	/**
     * 查询评论列表
     * 
     * @param comments 评论信息
     * @return 评论集合
     */
	public List<Comments> selectCommentsList(Comments comments);
	
	/**
     * 新增评论
     * 
     * @param comments 评论信息
     * @return 结果
     */
	public int insertComments(Comments comments);
	
	/**
     * 修改评论
     * 
     * @param comments 评论信息
     * @return 结果
     */
	public int updateComments(Comments comments);
	
	/**
     * 删除评论
     * 
     * @param coid 评论ID
     * @return 结果
     */
	public int deleteCommentsById(Integer coid);
	
	/**
     * 批量删除评论
     * 
     * @param coids 需要删除的数据ID
     * @return 结果
     */
	public int deleteCommentsByIds(String[] coids);
	
}