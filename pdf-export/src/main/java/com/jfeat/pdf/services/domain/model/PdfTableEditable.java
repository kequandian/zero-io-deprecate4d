package com.jfeat.pdf.services.domain.model;

/**
 * Created on 2020/3/13.
 *
 * @author Wen Hao
 */
public class PdfTableEditable {

    private String id;

    private String name;

    private String templateContent;


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTemplateContent() {
        return templateContent;
    }

    public void setTemplateContent(String templateContent) {
        this.templateContent = templateContent;
    }
}
