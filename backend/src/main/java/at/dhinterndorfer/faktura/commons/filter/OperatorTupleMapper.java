package at.dhinterndorfer.faktura.commons.filter;

import at.dhinterndorfer.faktura.commons.date.DateTimeMapper;
import at.dhinterndorfer.faktura.dto.v1.DateOperatorTupleRestDto;
import at.dhinterndorfer.faktura.dto.v1.NumberOperatorTupleRestDto;
import at.dhinterndorfer.faktura.dto.v1.StringOperatorTupleRestDto;
import com.querydsl.core.types.Ops;
import org.mapstruct.Mapper;

import java.time.LocalDateTime;
import java.util.List;

@Mapper(uses = DateTimeMapper.class)
public interface OperatorTupleMapper {

    default OperatorTuple<Long> map(NumberOperatorTupleRestDto operator) {
        if (operator == null || operator.getOperator() == null) {
            return null;
        }
        if (operator.getValue() == null) {
            return new OperatorTuple<>(Ops.valueOf(operator.getOperator().name()));
        }
        return new OperatorTuple<>(Ops.valueOf(operator.getOperator().name()), operator.getValue().longValue());
    }

    default OperatorTuple<String> map(StringOperatorTupleRestDto operator) {
        if (operator == null || operator.getOperator() == null) {
            return null;
        }
        if (operator.getValue() == null) {
            return new OperatorTuple<>(Ops.valueOf(operator.getOperator().name()));
        }
        return new OperatorTuple<>(Ops.valueOf(operator.getOperator().name()), operator.getValue());
    }

    default OperatorTuple<LocalDateTime> map(DateOperatorTupleRestDto operator) {
        if (operator == null || operator.getOperator() == null) {
            return null;
        }
        if (operator.getValue() == null) {
            return new OperatorTuple<>(Ops.valueOf(operator.getOperator().name()));
        }
        return new OperatorTuple<>(Ops.valueOf(operator.getOperator().name()), operator.getValue().toLocalDateTime());
    }
}