/*
 * @Descripttion:
 * @version:
 * @Author: seaslog
 * @Date: 2022-04-27 16:04:08
 * @LastEditors: 谢余华
 * @LastEditTime: 2022-04-30 15:57:49
 */
package routers

import (
	"log"

	"github.com/go-macaron/session"
	"github.com/xsec-lab/x-waf-admin/models"
	"gopkg.in/macaron.v1"
	"github.com/xsec-lab/x-waf-admin/modules/pager"
	"github.com/xsec-lab/x-waf-admin/setting"

)

func ListLogs(ctx *macaron.Context, sess session.Store) {
	if sess.Get("uid") != nil {

	    curPage  :=  ctx.ParamsInt(":id")
	    if curPage==0 {
	        curPage = 1
	    }
	    
    	allPage, _ := models.PageCount()
    	perNum    := setting.Cfg.Section("pager").Key("PAGEMax").MustInt(10)
    
    	if allPage%perNum == 0 {
    		allPage = perNum / perNum
    	} else {
    		allPage = allPage/perNum + 1
    	}
    	
    	
        var url = "/admin/waflog"
        pager := pager.NewPage(allPage,curPage,perNum,url)
        //样式1
        pagelist := pager.AllLink()
        ctx.Data["pagelist"] = pagelist


		waflog, _ := models.ListLogs(curPage)
		ctx.Data["waflog"] = waflog
		
		
		
		log.Println(waflog)
		ctx.HTML(200, "waflog")
	} else {
		ctx.Redirect("/login/")
	}
}

func ListIPs(ctx *macaron.Context, sess session.Store) {
	if sess.Get("uid") != nil {
		iplog, _ := models.ListIP()
		ctx.Data["iplogs"] = iplog
		log.Println(iplog)
		ctx.HTML(200, "iplogs")
	} else {
		ctx.Redirect("/login/")
	}

}

func ListTypes(ctx *macaron.Context, sess session.Store) {
	if sess.Get("uid") != nil {
		typelog, _ := models.Listtype()
		ctx.Data["typelogs"] = typelog
		log.Println(typelog)
		ctx.HTML(200, "typelog")
	} else {
		ctx.Redirect("/login/")
	}

}


func ListDate(ctx *macaron.Context, sess session.Store) {
	if sess.Get("uid") != nil {
		dates, _ := models.Listdate()
		ctx.Data["dates"] = dates
		log.Println(dates)
		ctx.HTML(200, "dates")
	} else {
		ctx.Redirect("/login/")
	}

}

