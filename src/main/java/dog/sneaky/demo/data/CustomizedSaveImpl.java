package dog.sneaky.demo.data;

public class CustomizedSaveImpl<T> implements CustomizedSave<T> {
    @Override
    public <S extends T> S save(S entity) {
        return null;
    }
}


