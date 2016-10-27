package com.mio.testDemo;

import com.github.axet.wget.WGet;
import com.mio.domain.Book;
import com.mio.utils.HttpUtil;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.testng.annotations.Test;

import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;

/**
 * Created by liuhe on 2016/10/21.
 * update
 */
public class HttpUtilTest {




    @Test
    public void testHttp(){


        String s = HttpUtil.sendGet("https://search.jd.com/Search\\", "keyword\\=9787115221704\\&enc\\=utf-8\\&wq\\=9787115221704");
        System.out.println(s);


    }
    @Test
    public void testJsoup2(){


        Book book = new Book();

        book.setIsbn("9787115221704");

        Book book1 = HttpUtil.dangdangSearch(book);

//        System.out.println(book1.getPrice());
//        System.out.println(book1.getAuthor());
//        System.out.println(book1.getBookName());

        System.out.println(book1);

    }

    @Test
    public void testHttp2(){


        try {
            // choise internet url (ftp, http)
            URL url = new URL("http://search.dangdang.com/?key=9787115221704");
            // choise target folder or filename "/Users/axet/Downloads/ap61.ram"
            File target = new File("/Users/liuhe/Downloads/a.html");
            // initialize wget object
            WGet w = new WGet(url, target);
            // single thread download. will return here only when file download
            // is complete (or error raised).
            w.download();
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (RuntimeException allDownloadExceptions) {
            allDownloadExceptions.printStackTrace();
        }


    }




    @Test
    public void testJsoup(){


        Document doc = null;
        try {
            doc = Jsoup.connect("http://search.dangdang.com/?key=9787115221704").get();
//            doc = Jsoup.parse(input, "UTF-8", "http://www.oschina.net/");
        } catch (IOException e) {
            e.printStackTrace();
        }

//        Element content = doc.getElementById("content");
        Elements line1 = doc.getElementsByClass("line1");
        String s = line1.toString();


        Document parse = Jsoup.parse(s);

        Elements search_pre_price = parse.getElementsByClass("search_pre_price");
        System.out.println(search_pre_price.get(0).data());
        Element element = search_pre_price.get(0);
        String text = element.text();
        System.out.println(text);

//        System.out.println(s);

//        Elements links = content.getElementsByTag("a");
//        for (Element link : links) {
//            String linkHref = link.attr("href");
//            String linkText = link.text();
//        }


    }
    @Test
    public void testJsoup3(){


        Document doc = null;
        try {
            doc = Jsoup.connect("http://product.dangdang.com/20801315.html").get();
//            doc = Jsoup.parse(input, "UTF-8", "http://www.oschina.net/");
        } catch (IOException e) {
            e.printStackTrace();
        }


        Element product_tab = doc.getElementById("product_tab");


        System.out.println();
//        Element content = doc.getElementById("content");
//        Elements line1 = doc.getElementsByClass("line1");
//        String s = line1.toString();
//
//
//        Document parse = Jsoup.parse(s);
//
//        Elements search_pre_price = parse.getElementsByClass("search_pre_price");
//        System.out.println(search_pre_price.get(0).data());
//        Element element = search_pre_price.get(0);
//        String text = element.text();
//        System.out.println(text);

//        System.out.println(s);

//        Elements links = content.getElementsByTag("a");
//        for (Element link : links) {
//            String linkHref = link.attr("href");
//            String linkText = link.text();
//        }


    }
}
