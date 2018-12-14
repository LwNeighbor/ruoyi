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
import com.ruoyi.blog.domain.Options;
import com.ruoyi.blog.service.IOptionsService;
import com.ruoyi.framework.web.base.BaseController;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.common.base.AjaxResult;
import com.ruoyi.common.utils.ExcelUtil;

/**
 * 配置 信息操作处理
 * 
 * @author lw
 * @date 2018-12-14
 */
@Controller
@RequestMapping("/blog/options")
public class OptionsController extends BaseController
{
    private String prefix = "blog/options";
	
	@Autowired
	private IOptionsService optionsService;
	
	@RequiresPermissions("blog:options:view")
	@GetMapping()
	public String options()
	{
	    return prefix + "/options";
	}
	
	/**
	 * 查询配置列表
	 */
	@RequiresPermissions("blog:options:list")
	@PostMapping("/list")
	@ResponseBody
	public TableDataInfo list(Options options)
	{
		startPage();
        List<Options> list = optionsService.selectOptionsList(options);
		return getDataTable(list);
	}
	
	
	/**
	 * 导出配置列表
	 */
	@RequiresPermissions("blog:options:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Options options)
    {
    	List<Options> list = optionsService.selectOptionsList(options);
        ExcelUtil<Options> util = new ExcelUtil<Options>(Options.class);
        return util.exportExcel(list, "options");
    }
	
	/**
	 * 新增配置
	 */
	@GetMapping("/add")
	public String add()
	{
	    return prefix + "/add";
	}
	
	/**
	 * 新增保存配置
	 */
	@RequiresPermissions("blog:options:add")
	@Log(title = "配置", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@ResponseBody
	public AjaxResult addSave(Options options)
	{		
		return toAjax(optionsService.insertOptions(options));
	}

	/**
	 * 修改配置
	 */
	@GetMapping("/edit/{name}")
	public String edit(@PathVariable("name") String name, ModelMap mmap)
	{
		Options options = optionsService.selectOptionsById(name);
		mmap.put("options", options);
	    return prefix + "/edit";
	}
	
	/**
	 * 修改保存配置
	 */
	@RequiresPermissions("blog:options:edit")
	@Log(title = "配置", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public AjaxResult editSave(Options options)
	{		
		return toAjax(optionsService.updateOptions(options));
	}
	
	/**
	 * 删除配置
	 */
	@RequiresPermissions("blog:options:remove")
	@Log(title = "配置", businessType = BusinessType.DELETE)
	@PostMapping( "/remove")
	@ResponseBody
	public AjaxResult remove(String ids)
	{		
		return toAjax(optionsService.deleteOptionsByIds(ids));
	}
	
}
