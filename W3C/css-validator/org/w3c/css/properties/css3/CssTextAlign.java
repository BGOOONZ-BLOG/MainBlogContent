//
// Author: Yves Lafon <ylafon@w3.org>
//
// (c) COPYRIGHT MIT, ERCIM and Keio University, Keio, 2012.
// Please first read the full copyright statement in file COPYRIGHT.html
package org.w3c.css.properties.css3;

import org.w3c.css.util.ApplContext;
import org.w3c.css.util.InvalidParamException;
import org.w3c.css.values.CssExpression;
import org.w3c.css.values.CssIdent;
import org.w3c.css.values.CssTypes;
import org.w3c.css.values.CssValue;

/**
 * @spec https://www.w3.org/TR/2021/CRD-css-text-3-20210422/#propdef-text-align
 */
public class CssTextAlign extends org.w3c.css.properties.css.CssTextAlign {

    private static CssIdent[] allowed_values;

    static {
        String id_values[] = {"start", "end", "left", "right", "center",
                "justify", "match-parent", "justify-all"};
        allowed_values = new CssIdent[id_values.length];
        int i = 0;
        for (String s : id_values) {
            allowed_values[i++] = CssIdent.getIdent(s);
        }
    }

    public static CssIdent getAllowedIdent(CssIdent ident) {
        for (CssIdent id : allowed_values) {
            if (id.equals(ident)) {
                return id;
            }
        }
        return null;
    }

    /**
     * Create a new CssTextAlign
     */
    public CssTextAlign() {
        value = initial;
    }

    /**
     * Creates a new CssTextAlign
     *
     * @param expression The expression for this property
     * @throws org.w3c.css.util.InvalidParamException Expressions are incorrect
     */
    public CssTextAlign(ApplContext ac, CssExpression expression, boolean check)
            throws InvalidParamException {
        setByUser();
        CssValue val = expression.getValue();

        if (check && expression.getCount() > 1) {
            throw new InvalidParamException("unrecognize", ac);
        }

        if (val.getType() != CssTypes.CSS_IDENT) {
            throw new InvalidParamException("value",
                    expression.getValue(),
                    getPropertyName(), ac);
        }
        CssIdent id = val.getIdent();
        if (!CssIdent.isCssWide(id) && getAllowedIdent(id) == null) {
            throw new InvalidParamException("value",
                    expression.getValue(),
                    getPropertyName(), ac);

        }
        value = val;
        expression.next();
    }

    public CssTextAlign(ApplContext ac, CssExpression expression)
            throws InvalidParamException {
        this(ac, expression, false);
    }
}

