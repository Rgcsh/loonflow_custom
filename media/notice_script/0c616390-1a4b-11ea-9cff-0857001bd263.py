"""
loonflow在调用通知脚本时会将工单一些属性通过全局变量的方式传进来，所以在此脚本中可以直接使用。变量如下
globals = {'title_result': title_result, 'content_result': content_result,
                   'participant': ticket_obj.participant, 'participant_type_id': ticket_obj.participant_type_id,
                   'multi_all_person': ticket_obj.multi_all_person, 'ticket_value_info': ticket_value_info,
                   'last_flow_log': last_flow_log, 'participant_info_list': participant_info_list}

ticket_value_info:{'creator': 'WH_A', 'gmt_modified': '2019-12-09 16:12:48', 'state_id': 14, 'gmt_created': '2019-12-09 14:18:35', 'participant_type_id': 1, 'sec_name': '二', 'sn': 'loonflow_201912090006', 'is_deleted': False, 'workflow_id': 3, 'parent_ticket_state_id': 0, 'in_add_node': False, 'script_run_last_result': True, 'sec_id': '地方23', 'sec_val': 0.0, 'add_node_man': '', 'is_end': False, 'id': 30, 'parent_ticket_id': 0, 'relation': 'WH_A,WH_TL', 'multi_all_person': '{}', 'title': '地方', 'is_rejected': False, 'participant': 'WH_TL'}
last_flow_log:{'participant_info': {'participant_alias': '维护人路人A', 'participant_type_id': 1, 'participant_email': '2020956572@qq.com', 'participant_phone': '', 'participant': 'WH_A'}, 'gmt_created': '2019-12-09 16:12:48', 'transition': {'transition_name': '重新提交', 'transition_id': 26, 'attribute_type_id': 1}, 'state': {'state_name': '发起人编辑中', 'state_id': 13}, 'suggestion': '对方答复', 'intervene_type_id': 0, 'participant_type_id': 1, 'ticket_id': 30, 'participant': 'WH_A', 'id': 109}
content_result:标题:地方, 创建时间:2019-12-09 14:18:35
"""
import traceback
from smtplib import SMTPRecipientsRefused

import yagmail


def send_email():
    # print({'title_result': title_result})
    # print({'last_flow_log': last_flow_log})
    # print({'content_result': content_result})
    # print({'ticket_value_info': ticket_value_info})
    # print({'participant_info_list': participant_info_list})
    # return True, ''

    SMTP_ACCOUNT = 'service@attractorcap.com'
    SMTP_PASSWORD = 'Attractor123'
    SMTP_HOST = 'smtp.exmail.qq.com'
    SMTP_PORT = '465'

    for item in participant_info_list:
        email = item['email']
        html = """<h1 style="color: #606266;">亲爱的 {} 同学，你有一个工作流工单待处理!</h1>
                    <h2>ticket_value_info:{}</h2>
                    <h2>last_flow_log:{}</h2>
                    <h2>content_result:{}</h2>""".format(
            item['alias'],
            ticket_value_info, last_flow_log, content_result)
        try:
            yag = yagmail.SMTP(SMTP_ACCOUNT, SMTP_PASSWORD, host=SMTP_HOST, port=SMTP_PORT)
            yag.send(email, title_result, html)
            print('成功发送 工作流 提醒处理邮件,目标邮箱为：{}'.format(email))
        except SMTPRecipientsRefused:
            print('需要发送给目标用户的邮箱 {} 被禁用或冻结或用户不存在,请处理此邮箱!'.format(email))
        except Exception:
            print(traceback.print_exc())


send_email()
