/*
 * @Descripttion:
 * @version:
 * @Author: seaslog
 * @Date: 2022-04-15 16:45:04
 * @LastEditors: 谢余华
 * @LastEditTime: 2022-04-30 15:54:34
 */
package models

import "log"

type WafLog struct {
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

type IpsLog struct {
	Num      int64
	ClientIp string
}

type TypeLog struct {
	Num        int64
	AttackType string
}

func ListLogs() (wlog []WafLog, err error) {
	wlog = make([]WafLog, 0)
	err = Engine.Limit(60).Desc("id").Find(&wlog)
	log.Println(err, wlog)
	return wlog, err
}

func ListIP() (ipsLogs []IpsLog, err error) {
	ipsLogs = make([]IpsLog, 0)
	err = Engine.SQL("SELECT client_ip,COUNT(*) as num FROM `waf_log` GROUP BY client_ip ORDER BY num DESC").Find(&ipsLogs)
	log.Println(err, ipsLogs)
	return ipsLogs, err
}

func Listtype() (typelogs []TypeLog, err error) {
	typelogs = make([]TypeLog, 0)
	err = Engine.SQL("SELECT attack_type,COUNT(*) as num FROM `waf_log` GROUP BY attack_type ORDER BY num DESC").Find(&typelogs)
	log.Println(err, typelogs)
	return typelogs, err
}
