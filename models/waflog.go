/*
 * @Descripttion:
 * @version:
 * @Author: seaslog
 * @Date: 2022-04-15 16:45:04
 * @LastEditors: 谢余华
 * @LastEditTime: 2022-04-27 17:03:51
 */
package models

import (
	"log"
)

type Waflog struct {
	Id         int64
	ClientIp   string
	LocalTime  string
	ServerName string
	UserAgent  string
	AttackType string
	ReqUrl     string
	ReqData    string
	RuleTag    string
}

func ListLogs() (wlog []Waflog, err error) {
	wlog = make([]Waflog, 0)
	err = Engine.Find(&wlog)
	log.Println(err, wlog)
	return wlog, err
}
