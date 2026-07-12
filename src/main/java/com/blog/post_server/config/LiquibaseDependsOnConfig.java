package com.blog.post_server.config;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.config.BeanFactoryPostProcessor;
import org.springframework.beans.factory.config.ConfigurableListableBeanFactory;
import org.springframework.context.annotation.Configuration;
import org.springframework.beans.factory.config.BeanDefinition;

@Configuration
public class LiquibaseDependsOnConfig implements BeanFactoryPostProcessor {
    @Override
    public void postProcessBeanFactory(ConfigurableListableBeanFactory beanFactory) throws BeansException {
        if (beanFactory.containsBeanDefinition("entityManagerFactory")) {
            BeanDefinition emfb = beanFactory.getBeanDefinition("entityManagerFactory");
            String[] dependsOn = emfb.getDependsOn();
            if (dependsOn == null) {
                emfb.setDependsOn("liquibase");
            } else {
                String[] newDependsOn = new String[dependsOn.length + 1];
                System.arraycopy(dependsOn, 0, newDependsOn, 0, dependsOn.length);
                newDependsOn[dependsOn.length] = "liquibase";
                emfb.setDependsOn(newDependsOn);
            }
        }
    }
}
