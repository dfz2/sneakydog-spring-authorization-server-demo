package dog.sneaky.demo.data.converters;

import dog.sneaky.demo.data.dp.Email;
import org.springframework.core.convert.converter.Converter;
import org.springframework.data.convert.ReadingConverter;


@ReadingConverter
public class StringToEmailReadingConverter implements Converter<String, Email> {
    @Override
    public Email convert(String source) {
        return new Email(source);
    }
}
