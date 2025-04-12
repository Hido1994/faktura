package at.dhinterndorfer.faktura.commons.filter;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;

import java.io.Serial;
import java.io.Serializable;
import java.util.NoSuchElementException;
import java.util.Objects;
import java.util.function.Consumer;

@AllArgsConstructor(access = AccessLevel.PRIVATE)
public class Nullable<T extends Serializable> implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    private static final Nullable<?> UNDEFINED = new Nullable<>(null, false);

    private T value;
    private boolean isPresent;

    public static <T extends Serializable> Nullable<T> undefined() {
        @SuppressWarnings("unchecked")
        Nullable<T> nullable = (Nullable<T>) UNDEFINED;
        return nullable;
    }

    public static <T extends Serializable> Nullable<T> of(T value) {
        return new Nullable<>(value, true);
    }

    public T get() {
        if (!isPresent) {
            throw new NoSuchElementException("Value is undefined");
        }

        return value;
    }

    public T orElse(T other) {
        return this.isPresent ? this.value : other;
    }

    public boolean isPresent() {
        return this.isPresent;
    }

    public boolean isPresentAndNotNull() {
        return this.isPresent && this.value != null;
    }

    public void ifPresent(Consumer<? super T> action) {
        if (this.isPresent) {
            action.accept(value);
        }
    }

    public void ifPresentAndNotNull(Consumer<? super T> action) {
        if (isPresentAndNotNull()) {
            action.accept(value);
        }
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }

        if (!(obj instanceof Nullable)) {
            return false;
        }

        Nullable<?> other = (Nullable<?>) obj;
        return Objects.equals(value, other.value)
            && Objects.equals(isPresent, other.isPresent);
    }

    @Override
    public int hashCode() {
        return Objects.hash(value, isPresent);
    }

    @Override
    public String toString() {
        if (!isPresent) {
            return "UNDEFINED";
        }

        return (get() != null) ? get().toString() : "null";
    }
}
