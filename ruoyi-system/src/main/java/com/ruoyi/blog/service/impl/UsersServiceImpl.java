package com.ruoyi.blog.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.blog.mapper.UsersMapper;
import com.ruoyi.blog.domain.Users;
import com.ruoyi.blog.service.IUsersService;
import com.ruoyi.common.support.Convert;

/**
 * 用户 服务层实现
 * 
 * @author lw
 * @date 2018-12-14
 */
@Service
public class UsersServiceImpl implements IUsersService 
{
	@Autowired
	private UsersMapper usersMapper;

	/**
     * 查询用户信息
     * 
     * @param uid 用户ID
     * @return 用户信息
     */
    @Override
	public Users selectUsersById(Integer uid)
	{
	    return usersMapper.selectUsersById(uid);
	}
	
	/**
     * 查询用户列表
     * 
     * @param users 用户信息
     * @return 用户集合
     */
	@Override
	public List<Users> selectUsersList(Users users)
	{
	    return usersMapper.selectUsersList(users);
	}
	
    /**
     * 新增用户
     * 
     * @param users 用户信息
     * @return 结果
     */
	@Override
	public int insertUsers(Users users)
	{
	    return usersMapper.insertUsers(users);
	}
	
	/**
     * 修改用户
     * 
     * @param users 用户信息
     * @return 结果
     */
	@Override
	public int updateUsers(Users users)
	{
	    return usersMapper.updateUsers(users);
	}

	/**
     * 删除用户对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	@Override
	public int deleteUsersByIds(String ids)
	{
		return usersMapper.deleteUsersByIds(Convert.toStrArray(ids));
	}
	
}
