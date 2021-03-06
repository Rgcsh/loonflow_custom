from django.urls import path
from apps.account.views import LoonUserView, LoonRoleView, LoonDeptView, LoonAppTokenView, LoonAppTokenDetailView, \
    LoonLoginView, LoonLogoutView, LoonUserRoleView, LoonRoleUserView
from apps.account.account_manage import LoonUserCreateView, LoonRoleCreateView, LoonDeptCreateView, LoonUserRoleCreateView

urlpatterns = [
    path('/users', LoonUserView.as_view()),
    path('/users/<int:user_id>/roles', LoonUserRoleView.as_view()),
    path('/roles', LoonRoleView.as_view()),
    path('/roles/<int:role_id>/users', LoonRoleUserView.as_view()),
    path('/depts', LoonDeptView.as_view()),
    path('/login', LoonLoginView.as_view()),
    path('/logout', LoonLogoutView.as_view()),
    path('/app_token', LoonAppTokenView.as_view()),
    path('/app_token/<int:app_token_id>', LoonAppTokenDetailView.as_view()),

    # rgc add new api
    path('/account_manage/user', LoonUserCreateView.as_view()),
    path('/account_manage/role', LoonRoleCreateView.as_view()),
    path('/account_manage/dept', LoonDeptCreateView.as_view()),
    path('/account_manage/user_role', LoonUserRoleCreateView.as_view()),
]
