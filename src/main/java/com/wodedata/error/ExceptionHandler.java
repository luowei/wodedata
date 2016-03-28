package com.wodedata.error;

import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by luowei on 16/3/28.
 */
public class ExceptionHandler implements HandlerExceptionResolver {
    @Override
    public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object o, Exception e) {
        e.printStackTrace();

        ModelAndView view = new ModelAndView(new MappingJackson2JsonView());
        view.addObject("code", "0");
        view.addObject("msg", e.getMessage() == null ? "发生异常" : e.getMessage());
        return view;
//        try {
//            PrintWriter write = response.getWriter();
//            write.print("{\"stat\":0,\"error\":\""+e.getMessage()+"\",\"data\":{} }");
//            return null;
//        } catch (IOException e1) {
//            e1.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
//        }
    }
}



