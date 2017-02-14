package com.mio.utils;

import com.github.axet.wget.WGet;
import com.mio.domain.Book;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.io.*;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

/**
 * Created by liuhe on 2016/10/21.
 * update
 */
public class HttpUtil {
    /**
     * 向指定URL发送GET方法的请求
     *
     * @param url
     *            发送请求的URL
     * @param param
     *            请求参数，请求参数应该是 name1=value1&name2=value2 的形式。
     * @return URL 所代表远程资源的响应结果
     */
    public static String sendGet(String url, String param) {
        String result = "";
        BufferedReader in = null;
        try {
            String urlNameString = url + "?" + param;
            URL realUrl = new URL("http://search.dangdang.com/?key=9787115221704");
            // 打开和URL之间的连接
            URLConnection connection = realUrl.openConnection();
            // 设置通用的请求属性
            connection.setRequestProperty("accept", "*/*");
            connection.setRequestProperty("connection", "Keep-Alive");
            connection.setRequestProperty("user-agent",
                    "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
            // 建立实际的连接
            connection.connect();
            // 获取所有响应头字段
            Map<String, List<String>> map = connection.getHeaderFields();
            // 遍历所有的响应头字段
            for (String key : map.keySet()) {
                System.out.println(key + "--->" + map.get(key));
            }
            // 定义 BufferedReader输入流来读取URL的响应
            in = new BufferedReader(new InputStreamReader(
                    connection.getInputStream()));
            String line;
            while ((line = in.readLine()) != null) {
                result += line;
            }
        } catch (Exception e) {
            System.out.println("发送GET请求出现异常！" + e);
            e.printStackTrace();
        }
        // 使用finally块来关闭输入流
        finally {
            try {
                if (in != null) {
                    in.close();
                }
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
        return result;
    }

    /**
     * 向指定 URL 发送POST方法的请求
     *
     * @param url
     *            发送请求的 URL
     * @param param
     *            请求参数，请求参数应该是 name1=value1&name2=value2 的形式。
     * @return 所代表远程资源的响应结果
     */
    public static String sendPost(String url, String param) {
        PrintWriter out = null;
        BufferedReader in = null;
        String result = "";
        try {
            URL realUrl = new URL(url);
            // 打开和URL之间的连接
            URLConnection conn = realUrl.openConnection();
            // 设置通用的请求属性
            conn.setRequestProperty("accept", "*/*");
            conn.setRequestProperty("connection", "Keep-Alive");
            conn.setRequestProperty("user-agent",
                    "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
            // 发送POST请求必须设置如下两行
            conn.setDoOutput(true);
            conn.setDoInput(true);
            // 获取URLConnection对象对应的输出流
            out = new PrintWriter(conn.getOutputStream());
            // 发送请求参数
            out.print(param);
            // flush输出流的缓冲
            out.flush();
            // 定义BufferedReader输入流来读取URL的响应
            in = new BufferedReader(
                    new InputStreamReader(conn.getInputStream()));
            String line;
            while ((line = in.readLine()) != null) {
                result += line;
            }
        } catch (Exception e) {
            System.out.println("发送 POST 请求出现异常！"+e);
            e.printStackTrace();
        }
        //使用finally块来关闭输出流、输入流
        finally{
            try{
                if(out!=null){
                    out.close();
                }
                if(in!=null){
                    in.close();
                }
            }
            catch(IOException ex){
                ex.printStackTrace();
            }
        }
        return result;
    }



    public static File dangdangSearch2(String isbn){

        File target = new File("/Users/liuhe/Downloads/"+isbn+".html");
        try {
            // choise internet url (ftp, http)
            URL url = new URL("http://search.dangdang.com/?key="+isbn);
            // choise target folder or filename "/Users/axet/Downloads/ap61.ram"
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
        return target;

    }

    public static Book dangdangSearch(Book book){

        Document doc = null;
        try {
            doc = Jsoup.connect("http://search.dangdang.com/?key="+book.getIsbn()).get();
        } catch (IOException e) {
            e.printStackTrace();
        }

        Document firstResult = Jsoup.parse(doc.getElementsByClass("line1").toString());

        System.out.println(firstResult);
        String attr = findAttr(firstResult, "search_pre_price");
//        String attr = findAttr(firstResult, "search_now_price");
        if (attr!=null){
            book.setPrice(Double.parseDouble(attr.substring(1)));
        }
//        System.out.println(attr);

//        Elements search_pre_price = firstResult.getElementsByClass("search_pre_price");
//        System.out.println(search_pre_price.get(0).data());
//        Element element = search_pre_price.get(0);
//        String text = element.text();
//        System.out.println(text);


        //设置作者

        String search_book_author = findAttr(firstResult, "search_book_author");

        if (search_book_author!=null){
            String[] split = search_book_author.split("/");
            book.setAuthor(split[0]);
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            try {
                book.setPublishTime(sdf.parse(split[1].trim()));
            } catch (ParseException e) {
                e.printStackTrace();
            }

            if (split.length>3){
                book.setPublisher(split[2]);
            }
        }



//        book.setBookName(findAttr(firstResult, "name"));
//        book.setOther(findAttr(firstResult,"detail"));

        Elements pic = firstResult.getElementsByClass("pic");

        Elements img = Jsoup.parse(pic.toString()).getElementsByTag("img");
        book.setImage(img.attr("src"));
        book.setBookName(img.attr("alt"));
        String link = firstResult.getElementsByClass("pic").attr("href");
        book.setLink(link);

        return book;
    }

    private static String findAttr(Document doc, String className){
//        Elements search_pre_price = doc.getElementsByClass(className);
//        Element element = search_pre_price.get(0);
//        String text = element.text();
        if (doc.getElementsByClass(className).size()>0){
            return doc.getElementsByClass(className).get(0).text();
        }{
            return null;
        }
    }

}