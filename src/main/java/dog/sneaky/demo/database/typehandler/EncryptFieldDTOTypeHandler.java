package dog.sneaky.demo.database.typehandler;

import dog.sneaky.demo.common.util.AesCryptoUtil;
import dog.sneaky.demo.common.EncryptFieldDTO;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.MappedJdbcTypes;
import org.apache.ibatis.type.MappedTypes;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


@Slf4j
@MappedJdbcTypes({JdbcType.VARCHAR})
@MappedTypes({EncryptFieldDTO.class})
public class EncryptFieldDTOTypeHandler extends BaseTypeHandler<EncryptFieldDTO> {

    @Override
    public void setNonNullParameter(PreparedStatement ps, int i, EncryptFieldDTO encryptFieldDTO, JdbcType jdbcType) throws SQLException {
        ps.setString(i, AesCryptoUtil.encryptToString(encryptFieldDTO.getPlainText(), "fa8f92af-fa83-443a-9626-e32b64481325"));
    }

    @Override
    public EncryptFieldDTO getNullableResult(ResultSet rs, String s) throws SQLException {
        return getEncryptFieldDTO(rs.getString(s));
    }

    @Override
    public EncryptFieldDTO getNullableResult(ResultSet rs, int i) throws SQLException {
        return getEncryptFieldDTO(rs.getString(i));
    }

    @Override
    public EncryptFieldDTO getNullableResult(CallableStatement cs, int i) throws SQLException {
        return getEncryptFieldDTO(cs.getString(i));
    }

    private EncryptFieldDTO getEncryptFieldDTO(String cipherText) throws SQLException {
        String maskText = "*****";
        String plainText = AesCryptoUtil.decryptToString(cipherText, "fa8f92af-fa83-443a-9626-e32b64481325");
        return new EncryptFieldDTO(plainText, cipherText, maskText);
    }
}
