package com.jfeat.zero.pdf.print.util;

/**
 * Created by vincent on 2018/3/19.
 */
public class MM {
    public static final double MM_PER_POINT = 25.4 / 72;
    public static final double MM_PER_DOT = 25.4 / 96;

    private static final double POINT_PER_MM = 72 / 25.4;

    private float dimen;

    public MM(float dimenInMM){
        this.dimen = dimenInMM;
    }

    public float px(){
        return (float) (this.dimen * POINT_PER_MM);
    }
}
