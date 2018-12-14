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
import com.ruoyi.blog.domain.Metas;
import com.ruoyi.blog.service.IMetasService;
import com.ruoyi.framework.web.base.BaseController;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.common.base.AjaxResult;
import com.ruoyi.common.utils.ExcelUtil;

/**
 * 项目 信息操作处理
 * 
 * @author lw
 * @date 2018-12-14
 */
@Controller
@RequestMapping("/blog/metas")
public class MetasController extends BaseController
{
    private String prefix = "blog/metas";
	
	@Autowired
	private IMetasService metasService;
	
	@RequiresPermissions("blog:metas:view")
	@GetMapping()
	public String metas()
	{
	    return prefix + "/metas";
	}
	
	/**
	 * 查询项目列表
	 */
	@RequiresPermissions("blog:metas:list")
	@PostMapping("/list")
	@ResponseBody
	public TableDataInfo list(Metas metas)
	{
		startPage();
        List<Metas> list = metasService.selectMetasList(metas);
		return getDataTable(list);
	}
	
	
	/**
	 * 导出项目列表
	 */
	@RequiresPermissions("blog:metas:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Metas metas)
    {
    	List<Metas> list = metasService.selectMetasList(metas);
        ExcelUtil<Metas> util = new ExcelUtil<Metas>(Metas.class);
        return util.exportExcel(list, "metas");
    }
	
	/**
	 * 新增项目
	 */
	@GetMapping("/add")
	public String add()
	{
	    return prefix + "/add";
	}
	
	/**
	 * 新增保存项目
	 */
	@RequiresPermissions("blog:metas:add")
	@Log(title = "项目", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@ResponseBody
	public AjaxResult addSave(Metas metas)
	{		
		return toAjax(metasService.insertMetas(metas));
	}

	/**
	 * 修改项目
	 */
	@GetMapping("/edit/{mid}")
	public String edit(@PathVariable("mid") Integer mid, ModelMap mmap)
	{
		Metas metas = metasService.selectMetasById(mid);
		mmap.put("metas", metas);
	    return prefix + "/edit";
	}
	
	/**
	 * 修改保存项目
	 */
	@RequiresPermissions("blog:metas:edit")
	@Log(title = "项目", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public AjaxResult editSave(Metas metas)
	{		
		return toAjax(metasService.updateMetas(metas));
	}
	
	/**
	 * 删除项目
	 */
	@RequiresPermissions("blog:metas:remove")
	@Log(title = "项目", businessType = BusinessType.DELETE)
	@PostMapping( "/remove")
	@ResponseBody
	public AjaxResult remove(String ids)
	{		
		return toAjax(metasService.deleteMetasByIds(ids));
	}
	
}
