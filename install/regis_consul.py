import consul
import requests


def regis(app_id, destination):
    service = consul.Client('http://localhost:8500')
    requests.put(service.endpoint + '/v1/agent/service/deregister/' + app_id)
    service.register(id=app_id, name=app_id,
                     address=destination,
                     check={'id': app_id, 'name': app_id,
                            'http': destination,
                            'Interval': '30s', 'timeout': '10s'})


if __name__ == '__main__':
    app_id_lst = ['hrm', 'qlcb', 'org-info', 'menu-suggest', 'bankhub', 'misa-id', 'bizcard', 'scanbill']
    destination_lst = [ 'http://hrm.hrm:17000/healthz',
                        'http://qlcb.qlcb:17010/healthz',
                        'http://org-info.org-info:8686/healthz',
                        'http://menu-suggest.menu-suggest:8787/index',
                        'https://testbankhub.misa.com.vn',
                        'http://id.misa.com.vn/api/healthz-misaid/healthz',
                        'http://bizcard.bizcard:9900/healthz',
                        'http://scanbill.scanbill:9090/healthz']
    for i in range(len(app_id_lst)):
        regis(app_id=app_id_lst[i], destination=destination_lst[i])