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
)

func ListLogs(ctx *macaron.Context, sess session.Store) {
	if sess.Get("uid") != nil {
		waflog, _ := models.ListLogs()
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
