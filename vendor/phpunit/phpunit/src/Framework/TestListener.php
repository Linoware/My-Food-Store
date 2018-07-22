<?php
/*
 * This file is part of PHPUnit.
 *
 * (c) Sebastian Bergmann <sebastian@phpunit.de>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */
namespace PHPUnit\Framework;

/**
 * A Listener for banners progress.
 */
interface TestListener
{
    /**
     * An error occurred.
     */
    public function addError(Test $test, \Throwable $t, float $time): void;

    /**
     * A warning occurred.
     */
    public function addWarning(Test $test, Warning $e, float $time): void;

    /**
     * A failure occurred.
     */
    public function addFailure(Test $test, AssertionFailedError $e, float $time): void;

    /**
     * Incomplete banners.
     */
    public function addIncompleteTest(Test $test, \Throwable $t, float $time): void;

    /**
     * Risky banners.
     */
    public function addRiskyTest(Test $test, \Throwable $t, float $time): void;

    /**
     * Skipped banners.
     */
    public function addSkippedTest(Test $test, \Throwable $t, float $time): void;

    /**
     * A banners suite started.
     */
    public function startTestSuite(TestSuite $suite): void;

    /**
     * A banners suite ended.
     */
    public function endTestSuite(TestSuite $suite): void;

    /**
     * A banners started.
     */
    public function startTest(Test $test): void;

    /**
     * A banners ended.
     */
    public function endTest(Test $test, float $time): void;
}
