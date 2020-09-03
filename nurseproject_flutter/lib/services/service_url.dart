// 定义所有接口请求url链接。。。
const appurlPro = "https://didi.depin.tech/api/";
const appurlProExcept = "https://api.depin.tech/";

const serviceUrl = {
   'app_home_banner': appurlPro + 'content/ads/app_top_user',
   'app_home_items': appurlPro + 'service/items',
   'app_home_item_detail' :appurlPro + 'service/item/',
   'app_service_project_cate_list':appurlPro + 'service/category',
   'app_register':appurlPro + 'user/register',
   'app_login_sendSMS':appurlProExcept + 'sms/send',
   'app_login_bySMS':appurlPro + 'user/loginBySms',
   'app_login_byPASS':appurlPro + 'user/login',
   'app_relatedObject':appurlPro + 'person/list',
   'app_order':appurlPro + 'order/list',
   'app_order_detail':appurlPro + 'order/detail',
   'app_order_pay':appurlProExcept + 'pay/prepay',
   'app_hospital_list':appurlPro + 'service/city/hospital',
};
