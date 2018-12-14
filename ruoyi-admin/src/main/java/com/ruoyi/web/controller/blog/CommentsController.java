package com.ruoyi.web.controller.blog;

import java.util.List;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.blog.domain.Comments;
import com.ruoyi.blog.service.ICommentsService;
import com.ruoyi.framework.web.base.BaseController;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.common.base.AjaxResult;
import com.ruoyi.common.utils.ExcelUtil;

/**
 * 评论 信息操作处理
 * 
 * @author lw
 * @date 2018-12-14
 */
@Controller
@RequestMapping("/blog/comments")
public class CommentsController extends BaseController
{
    private String prefix = "blog/comments";
	
	@Autowired
	private ICommentsService commentsService;
	
	@RequiresPermissions("blog:comments:view")
	@GetMapping()
	public String comments()
	{
	    return prefix + "/comments";
	}
	
	/**
	 * 查询评论列表
	 */
	@RequiresPermissions("blog:comments:list")
	@PostMapping("/list")
	@ResponseBody
	public TableDataInfo list(Comments comments)
	{
		startPage();
        List<Comments> list = commentsService.selectCommentsList(comments);
		return getDataTable(list);
	}
	
	
	/**
	 * 导出评论列表
	 */
	@RequiresPermissions("blog:comments:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Comments comments)
    {
    	List<Comments> list = commentsService.selectCommentsList(comments);
        ExcelUtil<Comments> util = new ExcelUtil<Comments>(Comments.class);
        return util.exportExcel(list, "comments");
    }
	
	/**
	 * 新增评论
	 */
	@GetMapping("/add")
	public String add()
	{
	    return prefix + "/add";
	}
	
	/**
	 * 新增保存评论
	 */
	@RequiresPermissions("blog:comments:add")
	@Log(title = "评论", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@ResponseBody
	public AjaxResult addSave(Comments comments)
	{		
		return toAjax(commentsService.insertComments(comments));
	}

	/**
	 * 修改评论
	 */
	@GetMapping("/edit/{coid}")
	public String edit(@PathVariable("coid") Integer coid, ModelMap mmap)
	{
		Comments comments = commentsService.selectCommentsById(coid);
		mmap.put("comments", comments);
	    return prefix + "/edit";
	}
	
	/**
	 * 修改保存评论
	 */
	@RequiresPermissions("blog:comments:edit")
	@Log(title = "评论", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public AjaxResult editSave(Comments comments)
	{		
		return toAjax(commentsService.updateComments(comments));
	}
	
	/**
	 * 删除评论
	 */
	@RequiresPermissions("blog:comments:remove")
	@Log(title = "评论", businessType = BusinessType.DELETE)
	@PostMapping( "/remove")
	@ResponseBody
	public AjaxResult remove(String ids)
	{		
		return toAjax(commentsService.deleteCommentsByIds(ids));
	}
	
}
