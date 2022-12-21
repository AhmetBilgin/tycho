/*******************************************************************************
 * Copyright (c) 2008, 2011 Sonatype Inc. and others.
 * This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License 2.0
 * which accompanies this distribution, and is available at
 * https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *    Sonatype Inc. - initial API and implementation
 *******************************************************************************/
package tycho.demo.itp01.tests;

import org.junit.Test;

import tycho.demo.itp.Bar;

public class ITP01Test {

    @Test
    public void test() {
        System.err.println("Hello from BarIT test");
        Bar bar = new Bar();
        bar.test();
    }
}
