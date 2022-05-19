/*
 * @Descripttion:
 * @version:
 * @Author: seaslog
 * @Date: 2022-04-15 16:45:04
 * @LastEditors: 谢余华
 * @LastEditTime: 2022-05-19 11:36:31
 */
package routers

import (
	"fmt"
	"log"

	"github.com/go-macaron/captcha"
	"github.com/go-macaron/session"
	"gopkg.in/macaron.v1"

	"github.com/xsec-lab/x-waf-admin/models"
	"github.com/xsec-lab/x-waf-admin/modules/util"
)

func Admin(ctx *macaron.Context, sess session.Store) {
	log.Println("session,", sess.Get("uid"))
	if sess.Get("uid") != nil {
		log.Println(sess.Get("uid"))
		// 站点
		sites, _ := models.ListSite()
		ctx.Data["sites"] = sites
		//今日ip
		dates, _ := models.TodayListIP()
		ctx.Data["dates"] = dates
		//今日类型
		typelog, _ := models.TodayListType()
		ctx.Data["typelogs"] = typelog
		//最近两周情况
		date, _ := models.Listdate()
		ctx.Data["date"] = date
		//黑名单
		blackips, _ := models.Blackip()
		ctx.Data["blackips"] = blackips
		//加载视图
		ctx.HTML(200, "AdminIndex")

	} else {
		ctx.Redirect("/login/")
	}
}

func SiteJSON(ctx *macaron.Context, sess session.Store) {
	if sess.Get("uid") != nil {
		log.Println(sess.Get("uid"))
		sites, _ := models.ListSite()
		ctx.JSON(200, sites)
	} else {
		ctx.Redirect("/login/")
	}
}

func Auth(ctx *macaron.Context, sess session.Store, cpt *captcha.Captcha) {
	if cpt.VerifyReq(ctx.Req) {
		username := ctx.Req.Form.Get("username")
		password := ctx.Req.Form.Get("password")
		ret, err := models.Auth(username, password)
		if err == nil && ret {
			sess.Set("uid", util.EncryptPass(fmt.Sprintf("%v+%v", username, util.EncryptPass(password))))
			ctx.Redirect("/admin/index/")
		} else {
			ctx.Redirect("/login/")
		}
	} else {
		message := "验证码输入错误"
		ctx.Data["message"] = message
		ctx.HTML(200, "error")
	}
}
