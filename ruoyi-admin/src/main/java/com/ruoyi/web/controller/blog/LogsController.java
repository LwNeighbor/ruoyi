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
import com.ruoyi.blog.domain.Logs;
import com.ruoyi.blog.service.ILogsService;
import com.ruoyi.framework.web.base.BaseController;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.common.base.AjaxResult;
import com.ruoyi.common.utils.ExcelUtil;

/**
 * 博客日志 信息操作处理
 * 
 * @author lw
 * @date 2018-12-14
 */
@Controller
@RequestMapping("/blog/logs")
public class LogsController extends BaseController
{
    private String prefix = "blog/logs";
	
	@Autowired
	private ILogsService logsService;
	
	@RequiresPermissions("blog:logs:view")
	@GetMapping()
	public String logs()
	{
	    return prefix + "/logs";
	}
	
	/**
	 * 查询博客日志列表
	 */
	@RequiresPermissions("blog:logs:list")
	@PostMapping("/list")
	@ResponseBody
	public TableDataInfo list(Logs logs)
	{
		startPage();
        List<Logs> list = logsService.selectLogsList(logs);
		return getDataTable(list);
	}
	
	
	/**
	 * 导出博客日志列表
	 */
	@RequiresPermissions("blog:logs:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Logs logs)
    {
    	List<Logs> list = logsService.selectLogsList(logs);
        ExcelUtil<Logs> util = new ExcelUtil<Logs>(Logs.class);
        return util.exportExcel(list, "logs");
    }
	
	/**
	 * 新增博客日志
	 */
	@GetMapping("/add")
	public String add()
	{
	    return prefix + "/add";
	}
	
	/**
	 * 新增保存博客日志
	 */
	@RequiresPermissions("blog:logs:add")
	@Log(title = "博客日志", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@ResponseBody
	public AjaxResult addSave(Logs logs)
	{		
		return toAjax(logsService.insertLogs(logs));
	}

	/**
	 * 修改博客日志
	 */
	@GetMapping("/edit/{id}")
	public String edit(@PathVariable("id") Integer id, ModelMap mmap)
	{
		Logs logs = logsService.selectLogsById(id);
		mmap.put("logs", logs);
	    return prefix + "/edit";
	}
	
	/**
	 * 修改保存博客日志
	 */
	@RequiresPermissions("blog:logs:edit")
	@Log(title = "博客日志", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public AjaxResult editSave(Logs logs)
	{		
		return toAjax(logsService.updateLogs(logs));
	}
	
	/**
	 * 删除博客日志
	 */
	@RequiresPermissions("blog:logs:remove")
	@Log(title = "博客日志", businessType = BusinessType.DELETE)
	@PostMapping( "/remove")
	@ResponseBody
	public AjaxResult remove(String ids)
	{		
		return toAjax(logsService.deleteLogsByIds(ids));
	}
	
}
