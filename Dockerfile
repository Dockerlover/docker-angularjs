# 基础镜像 
FROM docker-nodejs
# 维护人员
MAINTAINER  liuhong1.happy@163.com
# 添加环境变量
ENV USER_NAME admin
ENV SERVICE_ID angularjs
# 添加默认依赖npm包
RUN npm install -g bower 
RUN npm install -g grunt grunt-cli grunt-contrib-less grunt-contrib-jshint
RUN npm install karma --save-dev
RUN npm install -g yo 
RUN npm install -g generator-karma generator-angular  && npm cache clear
# 执行yo脚手架命令
WORKDIR /code
# 暴露9000端口
EXPOSE 9000 80
# 配置supervisord
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
# 启动supervisord
CMD ["/usr/bin/supervisord"]
