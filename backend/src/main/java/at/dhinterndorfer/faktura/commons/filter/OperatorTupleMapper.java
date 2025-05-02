package at.dhinterndorfer.faktura.commons.filter;

import at.dhinterndorfer.faktura.dto.v1.NumberOperatorTupleRestDto;
import at.dhinterndorfer.faktura.dto.v1.StringOperatorTupleRestDto;
import com.querydsl.core.types.Ops;
import org.mapstruct.Mapper;

@Mapper
public interface OperatorTupleMapper {

    default OperatorTuple<Long> map(NumberOperatorTupleRestDto operator) {
        if (operator == null) {
            return null;
        }
        if (operator.getValue() == null) {
            return new OperatorTuple<>(Ops.valueOf(operator.getOperator().name()));
        }
        return new OperatorTuple<>(Ops.valueOf(operator.getOperator().name()), operator.getValue().longValue());
    }

    default OperatorTuple<String> map(StringOperatorTupleRestDto operator) {
        if (operator == null) {
            return null;
        }
        if (operator.getValue() == null) {
            return new OperatorTuple<>(Ops.valueOf(operator.getOperator().name()));
        }
        return new OperatorTuple<>(Ops.valueOf(operator.getOperator().name()), operator.getValue());
    }
}