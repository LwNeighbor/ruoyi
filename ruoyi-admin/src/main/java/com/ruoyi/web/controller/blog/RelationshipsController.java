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
import com.ruoyi.blog.domain.Relationships;
import com.ruoyi.blog.service.IRelationshipsService;
import com.ruoyi.framework.web.base.BaseController;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.common.base.AjaxResult;
import com.ruoyi.common.utils.ExcelUtil;

/**
 * 内容与项目关系 信息操作处理
 * 
 * @author lw
 * @date 2018-12-14
 */
@Controller
@RequestMapping("/blog/relationships")
public class RelationshipsController extends BaseController
{
    private String prefix = "blog/relationships";
	
	@Autowired
	private IRelationshipsService relationshipsService;
	
	@RequiresPermissions("blog:relationships:view")
	@GetMapping()
	public String relationships()
	{
	    return prefix + "/relationships";
	}
	
	/**
	 * 查询内容与项目关系列表
	 */
	@RequiresPermissions("blog:relationships:list")
	@PostMapping("/list")
	@ResponseBody
	public TableDataInfo list(Relationships relationships)
	{
		startPage();
        List<Relationships> list = relationshipsService.selectRelationshipsList(relationships);
		return getDataTable(list);
	}
	
	
	/**
	 * 导出内容与项目关系列表
	 */
	@RequiresPermissions("blog:relationships:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Relationships relationships)
    {
    	List<Relationships> list = relationshipsService.selectRelationshipsList(relationships);
        ExcelUtil<Relationships> util = new ExcelUtil<Relationships>(Relationships.class);
        return util.exportExcel(list, "relationships");
    }
	
	/**
	 * 新增内容与项目关系
	 */
	@GetMapping("/add")
	public String add()
	{
	    return prefix + "/add";
	}
	
	/**
	 * 新增保存内容与项目关系
	 */
	@RequiresPermissions("blog:relationships:add")
	@Log(title = "内容与项目关系", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@ResponseBody
	public AjaxResult addSave(Relationships relationships)
	{		
		return toAjax(relationshipsService.insertRelationships(relationships));
	}

	/**
	 * 修改内容与项目关系
	 */
	@GetMapping("/edit/{cid}")
	public String edit(@PathVariable("cid") Integer cid, ModelMap mmap)
	{
		Relationships relationships = relationshipsService.selectRelationshipsById(cid);
		mmap.put("relationships", relationships);
	    return prefix + "/edit";
	}
	
	/**
	 * 修改保存内容与项目关系
	 */
	@RequiresPermissions("blog:relationships:edit")
	@Log(title = "内容与项目关系", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public AjaxResult editSave(Relationships relationships)
	{		
		return toAjax(relationshipsService.updateRelationships(relationships));
	}
	
	/**
	 * 删除内容与项目关系
	 */
	@RequiresPermissions("blog:relationships:remove")
	@Log(title = "内容与项目关系", businessType = BusinessType.DELETE)
	@PostMapping( "/remove")
	@ResponseBody
	public AjaxResult remove(String ids)
	{		
		return toAjax(relationshipsService.deleteRelationshipsByIds(ids));
	}
	
}
