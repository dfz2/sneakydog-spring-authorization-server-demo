package dog.sneaky.demo.data.converters;

import dog.sneaky.demo.data.dp.Deleted;
import org.apache.commons.lang3.BooleanUtils;
import org.springframework.core.convert.converter.Converter;
import org.springframework.data.convert.ReadingConverter;


@ReadingConverter
public class StringToDeletedReadingConverter implements Converter<String, Deleted> {
    @Override
    public Deleted convert(String source) {
        return new Deleted(BooleanUtils.toBoolean(source));
    }
}
