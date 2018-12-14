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
import com.ruoyi.blog.domain.Article;
import com.ruoyi.blog.service.IArticleService;
import com.ruoyi.framework.web.base.BaseController;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.common.base.AjaxResult;
import com.ruoyi.common.utils.ExcelUtil;

/**
 * 文章 信息操作处理
 * 
 * @author ruoyi
 * @date 2018-12-14
 */
@Controller
@RequestMapping("/blog/article")
public class ArticleController extends BaseController
{
    private String prefix = "blog/article";
	
	@Autowired
	private IArticleService articleService;
	
	@RequiresPermissions("blog:article:view")
	@GetMapping()
	public String article()
	{
	    return prefix + "/article";
	}

	/**
	 * 发布文章
	 * @return
	 */
	@RequestMapping("/publish")
	public String pubArticle(){
		return prefix+"/publish";
	}

	/**
	 * 查询文章列表
	 */
	@RequiresPermissions("blog:article:list")
	@PostMapping("/list")
	@ResponseBody
	public TableDataInfo list(Article article)
	{
		startPage();
        List<Article> list = articleService.selectArticleList(article);
		return getDataTable(list);
	}
	
	
	/**
	 * 导出文章列表
	 */
	@RequiresPermissions("blog:article:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Article article)
    {
    	List<Article> list = articleService.selectArticleList(article);
        ExcelUtil<Article> util = new ExcelUtil<Article>(Article.class);
        return util.exportExcel(list, "article");
    }
	
	/**
	 * 新增文章
	 */
	@GetMapping("/add")
	public String add()
	{
	    return prefix + "/add";
	}
	
	/**
	 * 新增保存文章
	 */
	@RequiresPermissions("blog:article:add")
	@Log(title = "文章", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@ResponseBody
	public AjaxResult addSave(Article article)
	{		
		return toAjax(articleService.insertArticle(article));
	}

	/**
	 * 修改文章
	 */
	@GetMapping("/edit/{cid}")
	public String edit(@PathVariable("cid") Integer cid, ModelMap mmap)
	{
		Article article = articleService.selectArticleById(cid);
		mmap.put("article", article);
	    return prefix + "/edit";
	}
	
	/**
	 * 修改保存文章
	 */
	@RequiresPermissions("blog:article:edit")
	@Log(title = "文章", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public AjaxResult editSave(Article article)
	{		
		return toAjax(articleService.updateArticle(article));
	}
	
	/**
	 * 删除文章
	 */
	@RequiresPermissions("blog:article:remove")
	@Log(title = "文章", businessType = BusinessType.DELETE)
	@PostMapping( "/remove")
	@ResponseBody
	public AjaxResult remove(String ids)
	{		
		return toAjax(articleService.deleteArticleByIds(ids));
	}


}
