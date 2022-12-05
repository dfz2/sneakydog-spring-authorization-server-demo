package dog.sneaky.demo.data;

public interface CustomizedSave<T> {
    <S extends T> S save(S entity);
}
