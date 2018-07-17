package gachon.gtg.dao;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import gachon.gtg.domain.LectureVO;
@Repository
public class LectureDAOlmpl implements LectureDAO {
	private static final String namespace= "gachon.gtg.mapper.algoMapper";
	@Autowired
	private SqlSession sqlSession;
	static int total_leccredit=0;

    //declare fixed timetable array
    static ArrayList<LectureVO> f_lecs=new ArrayList<LectureVO>();//출력될 시간표 조합
    static ArrayList<ArrayList<LectureVO>> combinations=new ArrayList<ArrayList<LectureVO>>();

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public boolean duplication_check(ArrayList<LectureVO> f_lecs) {
		boolean result=true;
        for (ArrayList<LectureVO> combination:combinations) {

            if (new HashSet(combination).equals(new HashSet(f_lecs))) {
                //which combination is duplicated.

                System.out.println("--------BREAK-------");

                for (LectureVO lec:f_lecs){
                    System.out.println(lec.lecname+" "+lec.lectime);
                }
                System.out.println();
                for (LectureVO comb:combination){
                    System.out.println(comb.lecname+" "+comb.lectime);
                }

                System.out.println("\n"+combinations.indexOf(combination)+" is duplicated with this.");
                result=false;//중복 검증
            }else{
                continue;
            }
        }
        return result;
	}

	@Override
	public double cohesioncheck(ArrayList<String> lectime) {
		double cohesion_degree=0;//응집도
        //요일간 시간표 리스트
        ArrayList<Double> m_daytime=new ArrayList<Double>();
        ArrayList<Double> tu_daytime=new ArrayList<Double>();
        ArrayList<Double> w_daytime=new ArrayList<Double>();
        ArrayList<Double> th_daytime=new ArrayList<Double>();
        ArrayList<Double> f_daytime=new ArrayList<Double>();

        for (String lec:lectime){
            //요일마다 시간표리스트 추가
            String day= String.valueOf(lec.charAt(0));//day check in lectime  ex 월 화 수 목 금
            if (day.equals("월")){
                String type=String.valueOf(lec.charAt(1));//check time lectime abcd 1234567
                m_daytime.add(calc(type));

            }else if (day.equals("화")){
                String type=String.valueOf(lec.charAt(1));//check time lectime abcd 1234567
                tu_daytime.add(calc(type));

            }else if (day.equals("수")){
                String type=String.valueOf(lec.charAt(1));//check time lectime abcd 1234567
                w_daytime.add(calc(type));

            }else if (day.equals("목")){
                String type=String.valueOf(lec.charAt(1));//check time lectime abcd 1234567
                th_daytime.add(calc(type));

            }else if (day.equals("금")){
                String type=String.valueOf(lec.charAt(1));//check time lectime abcd 1234567
                f_daytime.add(calc(type));

            }
        }
        Collections.sort(m_daytime);
        Collections.sort(tu_daytime);
        Collections.sort(w_daytime);
        Collections.sort(th_daytime);
        Collections.sort(f_daytime);
        for (int i=0;i<m_daytime.size()-1;i++){
            cohesion_degree+=m_daytime.get(i+1)-m_daytime.get(i);
        }
        for (int i=0;i<tu_daytime.size()-1;i++){
            cohesion_degree+=tu_daytime.get(i+1)-tu_daytime.get(i);
        }
        for (int i=0;i<w_daytime.size()-1;i++){
            cohesion_degree+=w_daytime.get(i+1)-w_daytime.get(i);
        }
        for (int i=0;i<th_daytime.size()-1;i++){
            cohesion_degree+=th_daytime.get(i+1)-th_daytime.get(i);

        }
        for (int i=0;i<f_daytime.size()-1;i++){
            cohesion_degree+=f_daytime.get(i+1)-f_daytime.get(i);

        }

        return cohesion_degree;
	}

	@Override
	public boolean compare(String[] lectime, String lecname) {
        for (int i=0;i<f_lecs.size();i++)
            for (int j=0;j<lectime.length;j++){
                if (f_lecs.get(i).lecname.equals(lecname)){
                    return false;
                }else {
                    try {
                        String day=Character.toString(lectime[j].charAt(0));
                        if (lectime[j].equals(day+"1")) {
                            if (f_lecs.get(i).lectime.contains(lectime[j]) || f_lecs.get(i).lectime.contains(day+"A"))
                                return false;
                        } else if (lectime[j].equals(day+"2")) {
                            if (f_lecs.get(i).lectime.contains(lectime[j]) || f_lecs.get(i).lectime.contains(day+"A"))
                                return false;
                        } else if (lectime[j].equals(day+"3")) {
                            if (f_lecs.get(i).lectime.contains(lectime[j]) || f_lecs.get(i).lectime.contains(day+"B"))
                                return false;
                        } else if (lectime[j].equals(day+"4")) {
                            if (f_lecs.get(i).lectime.contains(lectime[j]) || f_lecs.get(i).lectime.contains(day+"B") || f_lecs.get(i).lectime.contains(day+"C"))
                                return false;
                        } else if (lectime[j].equals(day+"5")) {
                            if (f_lecs.get(i).lectime.contains(lectime[j]) || f_lecs.get(i).lectime.contains(day+"C"))
                                return false;
                        } else if (lectime[j].equals(day+"6")) {
                            if (f_lecs.get(i).lectime.contains(lectime[j]) || f_lecs.get(i).lectime.contains(day+"D"))
                                return false;
                        } else if (lectime[j].equals(day+"7")) {
                            if (f_lecs.get(i).lectime.contains(lectime[j]) || f_lecs.get(i).lectime.contains(day+"D") || f_lecs.get(i).lectime.contains(day+"E"))
                                return false;
                        } else if (lectime[j].equals(day+"8")) {
                            if (f_lecs.get(i).lectime.contains(lectime[j]) || f_lecs.get(i).lectime.contains(day+"E"))
                                return false;
                        } else if (lectime[j].equals(day+"A")) {
                            if (f_lecs.get(i).lectime.contains(lectime[j]) || f_lecs.get(i).lectime.contains(day+"1") || f_lecs.get(i).lectime.contains(day+"2"))
                                return false;
                        } else if (lectime[j].equals(day+"B")) {
                            if (f_lecs.get(i).lectime.contains(lectime[j]) || f_lecs.get(i).lectime.contains(day+"3") || f_lecs.get(i).lectime.contains(day+"4"))
                                return false;
                        } else if (lectime[j].equals(day+"C")) {
                            if (f_lecs.get(i).lectime.contains(lectime[j]) || f_lecs.get(i).lectime.contains(day+"4") || f_lecs.get(i).lectime.contains(day+"5"))
                                return false;
                        } else if (lectime[j].equals(day+"D")) {
                            if (f_lecs.get(i).lectime.contains(lectime[j]) || f_lecs.get(i).lectime.contains(day+"6") || f_lecs.get(i).lectime.contains(day+"7"))
                                return false;
                        } else if (lectime[j].equals(day+"E")) {
                            if (f_lecs.get(i).lectime.contains(lectime[j]) || f_lecs.get(i).lectime.contains(day+"7") || f_lecs.get(i).lectime.contains(day+"8"))
                                return false;
                        }
                    } catch (StringIndexOutOfBoundsException e) {
                        System.out.println(lectime[j]);
                        System.err.printf("%nException : %s%n",e);
                        e.printStackTrace();
                    }
                }
            }
        return true;
    }
	
	public static HashMap<String,Object> changevalue(List<HashMap<String,Object>> list){
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		String title=null;
		String time=null;
		int credit=0;
		
		for(int i=0;i<list.size();i++) {
			System.out.println("리스트사이즈"+list.size());
			 Map<String, Object> map = list.get(i);
	            // map에 담긴 data를 꺼내어 변경 후 변수 result에 저장

	            title=map.get("title").toString();
	            time=map.get("time").toString();
	            credit=(int) map.get("credit");
	            resultMap.put("title",title);
	            resultMap.put("time",time);
	            resultMap.put("credit",credit);
		}
		return resultMap;
	}
	@Override
	public ArrayList<LectureVO> result(int credits,int max_credits,String major) throws Exception {
		ArrayList<LectureVO> lecs = new ArrayList<LectureVO>();//시간표들
        HashMap<Integer,Double> cohesion_checked_list = new HashMap<Integer, Double>();
        ValueComparator bvc = new ValueComparator(cohesion_checked_list);
        TreeMap<Integer, Double> sorted_map = new TreeMap<Integer, Double>(bvc);
        
        Map<String, Object> parameters = new HashMap<String, Object>();
		 parameters.put("major",major);
		
		List<HashMap<String,Object>> results=sqlSession.selectList(namespace+".algo",parameters);
		System.out.println("sqlresult"+results);
		HashMap<String,Object> Llist=changevalue(results);

        for(int i=0;i<Llist.size();i++) {
        	
        	String time=(String) Llist.get("time");
        	System.out.println("time"+time);
        	time=time.replaceAll("","");
        	int credit=(int) Llist.get("credit");
        	lecs.add(new LectureVO(Llist.get("title").toString(),time,credit));
        }
        for (int num=0;num<5;num++) {
        	System.out.println("result함수3");
            double cohesion=0.0;
            total_leccredit=0;
            Collections.shuffle(lecs);
            f_lecs.clear();
            f_lecs.add(lecs.get(0));
            total_leccredit+=f_lecs.get(0).lec_credit;
            System.out.println("리스트"+lecs);

            for (int i=1;i<lecs.size();i++){//시간표 후보군(from db) 속에서 조합시작
            	System.out.println("result함수4");
                if(credits<=total_leccredit&&total_leccredit<=max_credits){// 범위설정

                    if (!duplication_check(f_lecs)){//과목들의 중복검사
                        System.out.println(num+" is duplicated.\n");
                        break;
                    }
                    else{
                        //deep copy. shallow copy는 clear시 연결되어 같이 초기화됨.
                        combinations.add((ArrayList<LectureVO>)f_lecs.clone());//이 부분은 티스토리에 같이 적는 것이 좋겠다.
                    }
                    System.out.println("\n"+num);

                    //make lectime_list for checking cohesion
                    ArrayList<String> lectime_list= new ArrayList<String>();

                    //lectime& lecname show
                    for (LectureVO lec : f_lecs) {
                        System.out.println(lec.lecname+" "+lec.lectime);
                        String[] lecs_splited=lec.lectime.split(",");
                        for (String piece:lecs_splited){
                            lectime_list.add(piece);
                        }
                    }
                    System.out.println(total_leccredit);

                    System.out.print("Not sorted : ");
                    for (String lec : lectime_list){
                        System.out.print(lec);//before sort print
                    }
                    System.out.println();

                    System.out.print("Sorted : ");
                    Collections.sort(lectime_list);//sorted lectime
                    for (String lec:lectime_list){
                        System.out.print(lec);
                    }
                    System.out.println();

                    cohesion=cohesioncheck(lectime_list);
                    System.out.print(cohesion);
                    System.out.println("\n\nDone\n");
                    cohesion_checked_list.put(combinations.indexOf(f_lecs),cohesion);
                    break;

                }else if(compare(lecs.get(i).lectime.split(","),lecs.get(i).lecname)){
                    //범위에 도달하지 못했다면 add.
                    f_lecs.add(lecs.get(i));
                    total_leccredit+=lecs.get(i).lec_credit;

                }
            }
        }
        System.out.println("unsorted map: " + cohesion_checked_list);
        sorted_map.putAll(cohesion_checked_list);
        System.out.println("results: " + sorted_map);
        // cohesion sort
        return f_lecs;
	}

	@Override
	public double calc(String type) {
		 double result=0;
	        if (isAlpha(type)){
	            double itype = type.charAt(0);//아스키 코드값으로 변환
	            return itype;
	        }else if (isNumeric(type)){
	            double itype = Double.parseDouble(type);//알파벳 교시와 맞춤
	            double ichange=change(itype);
	            return ichange;
	        }
	        return result;

	}

	@Override
	public double change(double time) {
		if(time==1 || time==2 || time==3){
            time+=63;
        }else if (time==4){
            time+=62.5;
        }else if (time==5 || time==6){
            time+=62;
        }else if (time==7){
            time+=61.5;
        }else {
            time+=61;
        }
        return time;
	}

	@Override
	public boolean isAlpha(String str) {
		 return str.matches("^[a-zA-Z]*$");
	}

	@Override
	public boolean isNumeric(String str) {
		return str.matches("^[1-9]*$");
	}

}
class ValueComparator implements Comparator<Integer> {
    Map<Integer, Double> base;

    public ValueComparator(Map<Integer, Double> base) {
        this.base = base;
    }
    // Note: this comparator imposes orderings that are inconsistent with
    // equals.
    public int compare(Integer a, Integer b) {
        if (base.get(a) <= base.get(b)) {
            return -1;
        } else {
            return 1;
        } // returning 0 would merge keys
    }

}
