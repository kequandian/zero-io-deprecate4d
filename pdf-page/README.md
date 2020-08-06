## .pdf文档处理小工具
`用于对pdf文件页进行处理，如增加页，删除页`

```bash
$ gradlew fatjar

BUILD SUCCESSFUL in 1s
2 actionable tasks: 2 executed

$ java -jar build/libs/pdf-page-all.jar
Usage: pdf-page <image-url|image-dir>
       pdf-page <source> <OPTIONS> <PARAM> [..]
OPTIONS:
 -h,--head   Head with images/pages.
             pdf-page <source> -h <image-url|image-dir>
 -t,--tail   Tail up images/pages
             pdf-page <source> -t <image-url|image-dir|pages.pdf>
 -d,--delete Delete page.
             pdf-page <source> -d <page-range>
             Page range support 1,2 [3-5], -1 mean last page.
 -m,--mask   Mask specific area on page.
             pdf-page <source> -m <page-number> <pos> <size>
 -r,--ruler  Draw a ruler on page.
             pdf-page <source> -r <page-number>
 -T,--text   Draw text on page.
             pdf-page <source> -t <page-number> <posx> <posy> <text> <LEFT|CENTER|RIGHT> <fontSize> [fontFamily]
 -p,--print  Print the number of position on the page.
             pdf-page <source> -p <page-number>
```
