package at.dhinterndorfer.faktura.commons.filter;

import org.mapstruct.Mapper;
import org.openapitools.jackson.nullable.JsonNullable;

import java.io.Serializable;

@Mapper
public interface NullableMapper {

    default <T extends Serializable> Nullable<T> map(JsonNullable<T> jsonNullable) {
        if (jsonNullable == null) {
            return null;
        }
        if (jsonNullable.isPresent()) {
            return Nullable.of(jsonNullable.orElse(null));
        }
        return Nullable.undefined();
    }
}