package at.dhinterndorfer.faktura.commons.filter;

import com.querydsl.core.types.Ops;
import lombok.Getter;
import org.springframework.lang.NonNull;

import java.io.Serial;
import java.io.Serializable;

@Getter
public class OperatorTuple<T extends Serializable> implements Serializable {

    @Serial
    private static final long serialVersionUID = -8718210780329456814L;

    private final T value;

    private final Ops operator;

    public OperatorTuple(@NonNull Ops operator) {
        this(operator, null);
    }

    public OperatorTuple(@NonNull Ops operator, T value) {
        if (value != null && (Ops.IS_NULL.equals(operator) || Ops.IS_NOT_NULL.equals(operator))) {
            throw new IllegalArgumentException("Value must be null for null-operations");
        }

        this.operator = operator;
        this.value = value;
    }
}
