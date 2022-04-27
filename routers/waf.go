/*
 * @Descripttion:
 * @version:
 * @Author: seaslog
 * @Date: 2022-04-27 16:04:08
 * @LastEditors: 谢余华
 * @LastEditTime: 2022-04-27 17:08:16
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
