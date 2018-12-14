package com.ruoyi.blog.mapper;

import com.ruoyi.blog.domain.Users;
import java.util.List;	

/**
 * 用户 数据层
 * 
 * @author lw
 * @date 2018-12-14
 */
public interface UsersMapper 
{
	/**
     * 查询用户信息
     * 
     * @param uid 用户ID
     * @return 用户信息
     */
	public Users selectUsersById(Integer uid);
	
	/**
     * 查询用户列表
     * 
     * @param users 用户信息
     * @return 用户集合
     */
	public List<Users> selectUsersList(Users users);
	
	/**
     * 新增用户
     * 
     * @param users 用户信息
     * @return 结果
     */
	public int insertUsers(Users users);
	
	/**
     * 修改用户
     * 
     * @param users 用户信息
     * @return 结果
     */
	public int updateUsers(Users users);
	
	/**
     * 删除用户
     * 
     * @param uid 用户ID
     * @return 结果
     */
	public int deleteUsersById(Integer uid);
	
	/**
     * 批量删除用户
     * 
     * @param uids 需要删除的数据ID
     * @return 结果
     */
	public int deleteUsersByIds(String[] uids);
	
}