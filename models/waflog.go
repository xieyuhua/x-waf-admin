/*
 * @Descripttion:
 * @version:
 * @Author: seaslog
 * @Date: 2022-04-15 16:45:04
 * @LastEditors: 谢余华
 * @LastEditTime: 2022-05-19 11:35:36
 */
package models

import "log"
import "github.com/xsec-lab/x-waf-admin/setting"
import "strconv"
type WafLog struct {
	Id         int64
	ClientIp   string
	LocalTime  string
	ServerName string
	UserAgent  string
	AttackType string
	ReqUrl     string
	Area     string
	ReqData    string
	RuleTag    string
}
type IpsLog struct {
	Num      int64
	Area     string
	ClientIp string
}

type TypeLog struct {
	Num        int64
	AttackType string
}

type Datenum struct {
	Date string
	Num  string
}

func PageCount() (total int, err error) {
    wlog := new(WafLog)
    var totalb int64
	totalb,err = Engine.Count(wlog)
	totals := strconv.FormatInt(totalb,10)
	total,err = strconv.Atoi(totals)
	log.Println(err, total)
	return total, err
}


func ListLogs(curPage int) (wlog []WafLog, err error) {
	wlog = make([]WafLog, 0)
    PageSize := setting.Cfg.Section("pager").Key("PAGEMax").MustInt(10)

	offset := PageSize * (curPage - 1)
	err = Engine.Limit(PageSize, offset).Find(&wlog)
// 	err = Engine.Limit(5,1).Desc("id").Find(&wlog)
	log.Println(err, wlog)
	return wlog, err
}



func ListIP() (ipsLogs []IpsLog, err error) {
	ipsLogs = make([]IpsLog, 0)
	err = Engine.SQL("SELECT client_ip,area,COUNT(*) as num FROM `waf_log` GROUP BY client_ip ORDER BY num DESC").Find(&ipsLogs)
	log.Println(err, ipsLogs)
	return ipsLogs, err
}

func Listdate() (dates []Datenum, err error) {
	dates = make([]Datenum, 0)
	err = Engine.SQL("SELECT substring_index(local_time, ' ', 1) as date,COUNT(*) as num FROM `waf_log` GROUP BY date ORDER BY date DESC LIMIT 15").Find(&dates)
	log.Println(err, dates)
	return dates, err
}

func Listtype() (typelogs []TypeLog, err error) {
	typelogs = make([]TypeLog, 0)
	err = Engine.SQL("SELECT attack_type,COUNT(*) as num FROM `waf_log` GROUP BY attack_type ORDER BY num DESC").Find(&typelogs)
	log.Println(err, typelogs)
	return typelogs, err
}

type TodayTypeLog struct {
	Num        int64
	Area       string
	AttackType string
}

func TodayListType() (todaytypelogs []TodayTypeLog, err error) {
	todaytypelogs = make([]TodayTypeLog, 0)
	err = Engine.SQL("SELECT attack_type,COUNT(*) as num,group_concat(DISTINCT area) AS `area` FROM `waf_log` where to_days(local_time) = to_days(now()) GROUP BY attack_type ORDER BY num DESC").Find(&todaytypelogs)
	log.Println(err, todaytypelogs)
	return todaytypelogs, err
}

type TodayIpsLog struct {
	Num        int64
	Area       string
	ClientIp   string
	AttackType string
}

func TodayListIP() (todayipsLogs []TodayIpsLog, err error) {
	todayipsLogs = make([]TodayIpsLog, 0)
	err = Engine.SQL("SELECT client_ip,area,COUNT(*) as num,group_concat(DISTINCT attack_type) AS `attack_type` FROM `waf_log` where to_days(local_time) = to_days(now()) GROUP BY client_ip ORDER BY num DESC").Find(&todayipsLogs)
	log.Println(err, todayipsLogs)
	return todayipsLogs, err
}

type BlackIp struct {
	RuleType string
	RuleItem string
}

func Blackip() (blackip []BlackIp, err error) {
	blackip = make([]BlackIp, 0)
	err = Engine.SQL("SELECT * FROM `rules` WHERE rule_type='blackip'").Find(&blackip)
	log.Println(err, blackip)
	return blackip, err
}
