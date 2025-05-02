package at.dhinterndorfer.faktura.commons.date;

import at.dhinterndorfer.faktura.commons.filter.Nullable;
import org.mapstruct.Mapper;
import org.openapitools.jackson.nullable.JsonNullable;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.time.OffsetDateTime;
import java.time.ZoneOffset;

@Mapper
public interface DateTimeMapper {

    default LocalDateTime map(OffsetDateTime dateTime) {
        if (dateTime == null) {
            return null;
        }
        return dateTime.toLocalDateTime();
    }

    default OffsetDateTime map(LocalDateTime dateTime) {
        if (dateTime == null) {
            return null;
        }
        return dateTime.atOffset(ZoneOffset.UTC);
    }
}