import json

from django.views import View

from apps.account.models import LoonUser, LoonRole, LoonDept, LoonUserRole
from service.format_response import api_response


class LoonUserCreateView(View):
    def post(self, request, *args, **kwargs):
        """
        新增普通用户

        入参:
        username
        email
        password

        :param request:
        :param args:
        :param kwargs:
        :return:
        """
        json_str = request.body.decode('utf-8')
        if not json_str:
            return api_response(-1, 'post参数为空', {})
        request_data_dict = json.loads(json_str)
        username = request_data_dict.get('username', '')
        email = request_data_dict.get('email', '')
        password = request_data_dict.get('password', '')

        LoonUser().create_user(email, username, password)

        return api_response(0, '')


class LoonRoleCreateView(View):
    def post(self, request, *args, **kwargs):
        """
        新增权限

        入参:
        name
        description

        :param request:
        :param args:
        :param kwargs:
        :return:
        """
        json_str = request.body.decode('utf-8')
        if not json_str:
            return api_response(-1, 'post参数为空', {})
        request_data_dict = json.loads(json_str)
        name = request_data_dict.get('name', '')
        description = request_data_dict.get('description', '')

        LoonRole().create_role(name, description)

        return api_response(0, '')


class LoonDeptCreateView(View):
    def post(self, request, *args, **kwargs):
        """
        新增部门

        入参:
        name
        leader
        approver

        :param request:
        :param args:
        :param kwargs:
        :return:
        """
        json_str = request.body.decode('utf-8')
        if not json_str:
            return api_response(-1, 'post参数为空', {})
        request_data_dict = json.loads(json_str)
        name = request_data_dict.get('name', '')
        leader = request_data_dict.get('leader', '')
        approver = request_data_dict.get('approver', '')

        LoonDept().create_dept(name, leader, approver)

        return api_response(0, '')


class LoonUserRoleCreateView(View):
    def post(self, request, *args, **kwargs):
        """
        新增用户对应的角色

        入参:
        user_id
        role_id

        :param request:
        :param args:
        :param kwargs:
        :return:
        """
        json_str = request.body.decode('utf-8')
        if not json_str:
            return api_response(-1, 'post参数为空', {})
        request_data_dict = json.loads(json_str)
        user_id = request_data_dict.get('user_id', '')
        role_id = request_data_dict.get('role_id', '')

        LoonUserRole().create_user_role(user_id, role_id)

        return api_response(0, '')
