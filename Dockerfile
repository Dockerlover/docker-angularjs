# 基础镜像 
FROM docker-nodejs
# 维护人员
MAINTAINER  liuhong1.happy@163.com
# 添加环境变量
ENV USER_NAME admin
ENV SERVICE_ID angularjs
# 添加默认依赖npm包
RUN npm install -g bower grunt karma  
RUN npm install -g yo generator-karma generator-angular
# 添加额外需要的npm包
RUN npm install -g grunt-cli grunt-contrib-less grunt-contrib-jshint && npm cache clear
# 执行yo脚手架命令
RUN cd /cope; yo angular angularApp && grunt && grunt serve
# 暴露9000端口
EXPOSE 9000 80
# 配置supervisord
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
# 启动supervisord
CMD ["/usr/bin/supervisord"]





