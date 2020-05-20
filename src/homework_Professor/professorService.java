package homework_Professor;

public class professorService {

    static final String id_필수 = "ID를 입력하세요";
    static final String 이름_필수 = "이름을 입력하세요";
    static final String 학년_필수 = "학년을 입력하세요";
    static final String id_중복 = "ID가 중복됩니다";


    public static String validate(professor professor) throws Exception {
        if (professor.getId()==0)
            return id_필수;
        if (StringUtil.isEmptyOrBlank(professor.getProfessorName()))
            return 이름_필수;
        if (professor.getDepartmentId() == 0)
            return 학년_필수;
        professor professor1 = professorDAO.findById(professor.getId());
        if (professor1 != null && professor1.getId() == professor.getId())
            return id_중복;
        return null;
    }

    public static String insert(professor user) throws Exception {
        String errorMessage = validate(user);
        if (errorMessage != null) return errorMessage;
        professorDAO.insert(user);
        return null;
    }

    public static String update(professor user) throws Exception {
        String errorMessage = validate(user);
        if (errorMessage != null) return errorMessage;
        professorDAO.update(user);
        return null;
    }
}